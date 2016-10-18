//
//  StepSevenViewController.swift
//  hackForWeb
//
//  Created by 原田　礼朗 on 2016/10/19.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

// ②UIScrollViewと相談する準備その１
class StepSevenViewController: UIViewController,UIWebViewDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var id: String = "2016-048890"
    
    // ①画像をズームするため、UIScrollViewを用意
    @IBOutlet weak var scrollForZoomView: UIScrollView!
    // ①UIScrollViewの上にUIImageViewを用意
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.webView.delegate = self
        
        // ③UIScrollViewと相談する準備その２
        self.scrollForZoomView.delegate = self
        
        let url = URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM101_Top.action")
        let request = URLRequest(url: url!)
        self.webView.loadRequest(request)
        
        // ⑤webViewは表示しても意味ないため、隠しておく
        self.webView.isHidden = true
    }
    
    // ⑥UIScrollViewとの相談（tableViewと同じです）
    // ２指でピンチしたときどうする？（シミュレーターでは、optionキーを押しながらドラッグする）
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // 拡大したい部品をreturnしてあげる
        // どのくらいまで拡大するかは、storyboardのUIScrollViewを選択して、attribute inspector（五角形）で設定できる
        return self.imageView
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
        else if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM301_Detailed.action") {
            webView.stringByEvaluatingJavaScript(from: "$('.contents').find('a')[4].click()")
        }
            // 読み込み完了したwebページのURLが"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM401_ToImage.action"のとき
            // （「イメージ表示」ボタンをクリックしたあと読み込まれるURLは、"https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM401_ToImage.action"）
        else if webView.request?.url == URL(string: "https://www.j-platpat.inpit.go.jp/web/tokujitsu/tkbs/TKBS_GM401_ToImage.action") {
            // 画像のURLを取得する（webView内でJavaScriptを実行させる）
            let imgURL = webView.stringByEvaluatingJavaScript(from: "$('.image').find('img').attr('src')")
            print(imgURL)
            // ⑦取得した画像をimageViewに設定する
            // URLの画像データを取得する
            // まずは、URLを指定する（imgURLはオプショナルになっている。printの中身を見るとわかる。そのため、「!」をつける）
            let url = URL(string: "https://www.j-platpat.inpit.go.jp\(imgURL!)")
            // 上のurlの画像データを取得する（Dataさんに頼む。try-catch構文で書く必要がある）
            do {
                let imgData = try Data(contentsOf: url!)
                // 画像が取れたら、画像をimageViewに設定する
                self.imageView.image = UIImage(data: imgData)
            }
            catch {
                print("画像が取れませんでした")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
