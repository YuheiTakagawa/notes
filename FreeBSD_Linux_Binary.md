# FreeBSDでLinuxバイナリ互換機能を導入するには
- ネットワーク接続　https://www.freebsd.org/doc/handbook/network-wireless.html
- kldload linux64
- kldstatでlinux64.koがロードされているのを確認
- pkg install emulators/linux_base-c6
- /etc/rc.confに linux_enable="YES"　を追加