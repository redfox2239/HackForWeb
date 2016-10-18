//
//  ViewController.swift
//  hackForWeb
//
//  Created by 原田　礼朗 on 2016/10/19.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

// tableViewと相談する準備その１
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var exampleTableView: UITableView!
    // tableViewに使用するデータ
    var exampleData: [String] = [
        "ステップ１：特許情報プラットフォームを表示する",
        "ステップ２：公開・公表特許公報の項目を入力する方法",
        "ステップ３：照会ボタンを押す方法",
        "ステップ４：公開番号のリンクをクリックする方法",
        "ステップ５：イメージを表示ボタンを押す方法",
        "ステップ６：表示された画像URLを取得する方法",
        "ステップ７：取得した画像URLをUIImageViewに表示する方法"
    ]
    // 移動先の画面
    var seguesData: [String] = [
        "ステップ１の画面へ",
        "ステップ２の画面へ",
        "ステップ３の画面へ",
        "ステップ４の画面へ",
        "ステップ５の画面へ",
        "ステップ６の画面へ",
        "ステップ７の画面へ",
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewと相談する準備その２
        self.exampleTableView.delegate = self
        self.exampleTableView.dataSource = self
    }
    
    // セクションの数どうする？
    func numberOfSections(in tableView: UITableView) -> Int {
        // １個でお願いします。
        return 1
    }
    
    // セルの数どうする？
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // exampleDataの数でお願いします。
        return exampleData.count
    }
    
    // 各行のセルの中身どうする？
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell"という名前の白いセルでお願いします。
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // cellのテキストラベルに文字を設定する
        cell.textLabel?.text = exampleData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    
    // 各行のセルを選んだときどうする？
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 次の画面へ移動する
        self.performSegue(withIdentifier: self.seguesData[indexPath.row], sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

