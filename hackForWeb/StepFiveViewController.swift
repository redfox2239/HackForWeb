//
//  StepFiveViewController.swift
//  hackForWeb
//
//  Created by 原田　礼朗 on 2016/10/19.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class StepFiveViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
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
    // webViewがページを読み込むたびにどうする？と相談される。
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 読み込み完了したwebページのURLが"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action"のとき
        if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action") {
            webView.stringByEvaluatingJavaScript(from: "$($('#searchForm').find('input')[0]).val('\(self.id)');")
            webView.stringByEvaluatingJavaScript(from: "$($('#searchForm').find('input')).last().click()")
        }
        // 読み込み完了したwebページのURLが"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_SearchResult.action"のとき
        else if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_SearchResult.action") {
            webView.stringByEvaluatingJavaScript(from: "$($('#resultTable').find('a')[0]).click()")
        }
        // 読み込み完了したwebページのURLが"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM301_Detailed.action"のとき
        // （公開番号のリンクをクリックしたあと読み込まれるURLは、"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM301_Detailed.action"）
        else if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM301_Detailed.action") {
            // 「イメージ表示」ボタンを押す（webView内でJavaScriptを実行させる）
            webView.stringByEvaluatingJavaScript(from: "$('.contents').find('a')[5].click()")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
