# Fintech-FUN iOS勉強会第2回 2017/06/05資料

## ViewControllerについて
iOSに限らず，アプリケーション開発(Web含む)の様々な場面でViewやControllerなどの概念がある．これを **MVC(Model View Controller)** という．
- Model       : データ・ロジックを扱う
- View        : いわゆる画面，見える部分を扱う
- Controller  : 入力を受け取り，ModelやViewへ命令する


~~このようにMVCは役割を分担することで，管理・操作しやすくする．当然ファイルもMVCそれぞれに分けることが多い．
しかし，MVCを完全に分けない方法もいくつかある．Model + Controller，View のようにすることもある．直感的にこの方法はわかりやすいので，
今回の演習では，この方法を扱いたい．~~ ←話が逸れ過ぎているので…

ViewControllerとは，**Viewを操作するためのController** である．

## コードからオブジェクトを生成
オブジェクト : ボタンやラベルなどの画面に配置して，値の入出力をするためのもの  
ViewController.swiftというControllerを記述するswiftファイルに記述する．

**UIButton()** や **UILabel()** などを利用する
以下のようなコードをViewController.swiftに書けばラベルの作成ができる．

```swift:ViewController.swift
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad(){
    super.viewDidLoad()
    let label1 = UILabel()                    //UILabelというオブジェクトをlabel1として作成
    label1.text = "Hello World"               //label1のテキストを"Hello World"に変更
    label1.textColor = UIColor.red            //label1のテキストカラーを赤に変更
    label.sizeToFit()                         //label1のテキストを表示するだけに必要な大きさに設定
    label1.center = CGPoint(x: 200, y: 100)   //label1の位置を指定
    self.view.addSubview(label1)              //label1をViewに追加
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
```

- 注意点)
 - **self.view.addSubviewで画面に追加しないと表示されない**
 - **オブジェクトはサイズが指定されてないと表示されないこと**
 - コードで生成したオブジェクトは色が白+透明のため，背景白だと見えない

各パラメータ(label1.◯◯の◯◯)はUIButton()やUILabel()で異なる場合があるので注意すること(実際にUIButtonとUILabelとでは，テキストの扱い方などが異なる)

UIButton()の例も以下に挙げる

```swift:ViewController.swift
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad(){
    super.viewDidLoad()
    let button1 = UIButton()
    button1.setTitle("Hello World", for: UIControlState.normal)        //未タップ時のbutton1の表示を"Hello World"に変更
    button1.setTitleColor(UIColor.red, for: UIControlState.normal)     //未タップ時のbutton1のテキストカラーを赤に変更
    button1.sizeToFit()
    button1.center = CGPoint(x:200, y:200)
   //button1の位置と大きさを指定
    self.view.addSubview(button1)              //button1をViewに追加
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
```

- 注意点)
 - **self.view.addSubviewで画面に追加しないと表示されない**
 - **オブジェクトはサイズが指定されてないと表示されないこと**
 - UILabel()と違い，.text = ではなく，setTitle() となっている
 - setTitleの引数のUIControlState.normalはタップしてない時の表示テキストを設定
 - setTitleの引数をUIControlState.highlightedにすれば，タップ時の表示テキストを設定

以上のように，コードからオブジェクトを生成することができる．Storyboardで作成したオブジェクトをコードで操作することもできる．
