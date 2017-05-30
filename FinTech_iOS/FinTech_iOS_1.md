# Fintech-FUN iOS勉強会第1回 2017/05/30資料

## Xcodeの導入
すでにXcodeがインストールされていれば不要
App Storeからダウンロード（時間がかかるかも）
上のメニューバーから
**Xcode** > **About Xcode**
でXcodeのバージョンを確認(8.X.Xであれば良い)
![](../img/ios_1_1.png)

## 新規プロジェクトの作成
メニューバーから
**File** > **New** > **Project**
今回は **Single View Application** を選択して，**Next**
![](../img/ios_1_2.png)

**Product Name** を入力して **Next**
保存するディレクトリを選択して **Create**

![](../img/ios_1_3.png)
このような画面になればOK

## storyboardからテキストなどの配置
### オブジェクトをドラッグ&ドロップで配置する
左側にあるProject Nameなどが並んでいる場所から **Main.storyboard** をクリック
![](../img/ios_1_4.png)
すると，真っ白なView Controllerが出てくる．オブジェクトを追加する際は，以下の手順で操作する
1. 右下にある枠から丸いアイコンを押す
1. オブジェクトライブラリが表示される
1. 追加したいオブジェクトをドラッグして，View Controllerにドロップする
 1. 上の方にある黄色のオブジェクト(View ControllerやStoryboard Referenceなど)はView Controllerの外に配置する
 1. 下の方にある黄色ではないオブジェクト(LabelやButtonなど)はView Controllerの中に配置する
1. 右のほうにある枠を操作することで，配置したオブジェクトに様々な変更を加えることができる

![](../img/ios_1_5.png)

![](../img/ios_1_6.png)

![](../img/ios_1_7.png)
