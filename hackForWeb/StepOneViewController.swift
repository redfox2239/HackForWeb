//
//  StepOneViewController.swift
//  hackForWeb
//
//  Created by 原田　礼朗 on 2016/10/19.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

// webViewと相談する準備その１
class StepOneViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // webViewと相談する準備その２
        self.webView.delegate = self
        
        // urlを指定する
        let url = URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action")
        // 上記のurlをリクエストをする
        let request = URLRequest(url: url!)
        // webViewにリクエストしたものを表示する
        self.webView.loadRequest(request)
    }
    
    // webViewとの相談↓（tableViewと同じです）
    // webViewにwebページを読み終わったあとどうする？
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // webページを読み込み終わったときに、何かしたい場合にここに記載する。
        // 今回やりたいことは、特許の番号を入力して、照会ボタンを押す
        // そして、そのあとは、特許番号のリンクをクリックする
        // 特許のページに行ったら、画像の説明のあるページに移動する
        // 画像のURLを取得し、UIImageViewに表示する
        // webページの操作は、JavaScriptを実行する感じで進める
        
        // webViewが読み込み完了したwebページのURLを持っている
        print(webView.request?.url!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
