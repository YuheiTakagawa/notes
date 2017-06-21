# FreeBSD VPS(Virtual Private System)を扱う

注意)  
FreeBSD VPSを導入すると，USBの認識をFreeBSDがしなくなる可能性があるので，USBキーボードなどの入力もできなくなる場合があります．(カーネルかモジュールが上書きされるために，起きる問題だと思われます．)
## 1. ホストOS FreeBSDのインストール
FreeBSD VPSが対応しているのは，FreeBSD-8.XからFreeBSD-10.Xとされている  
※ FreeBSD-11.0-RELEASEでもVPSの動作した気がする…  
FreeBSD VPSを導入する際は，pkgを利用した方法がよく紹介されているが，pkgが利用できるのはFreeBSD-10.Xからのようなので，FreeBSD-10.3-RELEASEの導入が良いかも．  
<https://www.freebsd.org/where.html>よりFreeBSDのインストールイメージはダウンロードできるので，環境に合わせて選んでください．  
インストールの設定は各自で色々なサイトを探ってもらえると良いかも．  
いつも自分が行なっている設定を紹介  
1. KeyMap : Japan106x
1. Hostname : FreeBSD
1. Distribution : doc lib32 ports src
1. Partition : Manual(データが飛ぶ可能性があるので十分注意してください)  
1. ネットワークの設定は，繋がるものがあればこの段階で設定することをオススメします．(後でも設定はできますが，ここでやる方がいい)

## 2. FreeBSD VPSの導入
※ インターネットには，すでに繋がっているとします．インターネットへの接続は<https://www.kishiro.com/FreeBSD/wlan_11a_connection.html>を参考にするといいです．
まず，curl または wget をpkgでインストールします．(今回はcurlを想定)  


`pkg install curl`

その後，VPSのサイト<http://www.7he.at/freebsd/vps/>からcurlを利用してダウンロードする．

`curl http://www.7he.at/freebsd/vps/files/pkgs/vps-amd64-prod-r215.txz > vps.txz`

上記のコマンドを入力すれば，vps.txzはカレントディレクトリに作成される．

`pkg add vps.txz`

これで，FreeBSD VPSは導入されているはず．試しに以下のコマンドを入力してCommand not found.と表示されず，オプション一覧が表示されれば，無事導入されている．


`vpsctl`

## 3. FreeBSD VPSを使ってみる
ここまでくればあとは

<http://www.7he.at/freebsd/vps/docs/setup_testenv.txt>

に従って行うと良い．
