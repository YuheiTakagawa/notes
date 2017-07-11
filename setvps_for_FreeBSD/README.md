# FreeBSD VPSを9.3-RELEASEに導入してLiveMigrationするための手順
※Live Migrationをするだけならこれを実行しなくても良い．今回はホストとの通信をした状態でのLive Migrationを目的としている．
[base.txz](ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/10.0-RELEASE/base.txz) : FreeBSDのbase.txzです．
1. FreeBSD-9.3-RELEASEを導入する
2. pkg_add vps-fbsd91-r130-amd64-prod.tbz
3. reboot
4. rootmountが表示されるかも ?でhdを確認 ufs:/dev/ad0p4
5. ./create_virtual_instance.sh \<container_name\> \<addr\>
	5.1 [create_virtual_instance](https://gist.github.com/furandon-pig/02f3f9c097d20f22b017)
6. ./setvps
	6.1 ホストのem0のIPアドレスを1.2.3.4に固定する
	6.2 /etc/rc.vpssetup.sh でvpsを設定
	6.3 vps0のIPアドレスを192.168.10.90に固定する
