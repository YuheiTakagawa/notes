# Embedded Linux size reduction techniques
## 自己紹介
- Michael Opdenacker
- free electronsの創業者で組み込みLinuxのエンジニア
- フランスのOrangeという通信会社の出身
- 組み込みLinuxの起動時間を早くする技術に興味があった

## カーネル/システムのサイズを減らす理由
- IoTデバイスで動作
- 起動も早くなる
- 消費電力も減る
- セキュリティとしても攻撃面が減る
- RAMの空きをアプリケーションに活用できる

## 今回話す理由
- ELCE 2015からサイズに関するセッションはなかった
- カーネルを小さくするためのプロジェクトが停止した
- 自分が今までやってこなかった方法を見るいい機会
- カーネルサイズに興味がある人をもう一度集めるいい機会
- 新しいグラフを共有することも良い

## Linux システムをどうやって小さくするのか
- RAM
 - 2~6MBが組み込みカーネルのために必要
 - 8~16MBがユーザ空間のために必要
 - 残りのRAMはパフォーマンスを左右する
- Storage
 - 組み込みカーネルは2~4MB
 - ユーザ空間は数百KB
 - 複雑でないユーザ空間なら8~16MBで十分

## コンパイラの最適化
- gccを使うときはオプション -Os をつけるとバイナリサイズを最小化できる
- オプション -Os は -O2 の最適化をサイズの増加なしで行える

## 最近のコンパイラを使う
- 汎用ARMのLinuxでコンパイルする
 - gcc 4.7 →407512 bytes (zImage)
 - gcc 6.2 →405968 bytes (zImage) -0.4%
   - zImage: カーネルイメージを圧縮したファイル

## gcc LTO の最適化を使う
- LTO : Link Time Optimization
- コードをリンクするときに不要なコードを排除する
- ソースファイルが一つしかないときにもやってくれる
- LTOを使ったコンパイルをするには gcc -Os -flto hogehoge.c -lm

## gcc LTOの最適化をした結果
- x86_64 で gcc 6.2
 - LTO未利用：2122624 bytes (unstripped), 1964432 bytes (stripped)
 - LTO利用：2064480 bytes (unstripped, -2.7%), 1915016 bytes (stripped, -2.6%)
- armelhf で gcc 6.2
 - LTO未利用： 1157588 bytes (unstripped), 1018972 bytes (stripped)
 - LTO利用：1118480 bytes (unstripped, -3.4%), 990248 bytes (stripped, -2.8%)
   - stripped : LTO以外の最適化を有効
   - unstripped : LTO以外の最適化を無効
- x86_64がarmよりも悪いわけではない．64bitシステムの方が32bitシステムよりも大きくなるから結果が違う

## gcc vs clang
- gcc 6.2.0 on x86_64
 - 1964432 bytes
 - with LTO: 1964432 bytes (-2.7%)
- clang 3.8.1 on x86_64
 - 1865592 bytes (-5%)
- gccが勝つのはhelloworld.cのような小さいプログラムの時
