# FreeBSDの解像度を変更するには

1. vidcontrol -i mode
	1.1 その環境が対応している解像度の一覧が表示される
2. vidcontrol MODE_(NUM)
	2.1 (NUM)は一覧で表示された左側の番号
3. /etc/rc.conf に allscreens_flags="MODE_(NUM)"
	3.1 納得な解像度になったら起動時に反映されるように設定する
