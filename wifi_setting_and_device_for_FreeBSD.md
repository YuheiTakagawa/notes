# FreeBSD-10.3-RELEASEでwifiデバイスが認識させて，wifiに接続させる
- pciconf -v -l でipc関係のデバイスを確認
- wifiのデバイスがどう認識されているか em0 ath0 none2など
- none になっている場合はカーネル内のデバイスの設定がなされていない
- ifconfigで見ると lo と em0しかない
- cd /sys/modules/iwn
- make
- make install
