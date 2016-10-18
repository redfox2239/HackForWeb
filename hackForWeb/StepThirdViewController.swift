//
//  StepThirdViewController.swift
//  hackForWeb
//
//  Created by 原田　礼朗 on 2016/10/19.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class StepThirdViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    // ③特許IDを保存する部品
    var id: String = "2016-048890"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.webView.delegate = self
        
        let url = URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action")
        let request = URLRequest(url: url!)
        self.webView.loadRequest(request)
    }
    
    // webViewとの相談↓（tableViewと同じです）
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // ①読み込み完了したwebページのURLが"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action"のとき
        if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action") {
            // ②特許番号を入力する（webView内でJavaScriptを実行させる）③で、特許のIDを用意
            webView.stringByEvaluatingJavaScript(from: "$($('#searchForm').find('input')[0]).val('\(self.id)');")
            // ④「照会」ボタンを押す（webView内でJavaScriptを実行させる）
            webView.stringByEvaluatingJavaScript(from: "$($('#searchForm').find('input')).last().click()")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
