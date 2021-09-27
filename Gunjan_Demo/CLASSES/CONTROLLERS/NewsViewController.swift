//
//  NewsViewController.swift
//  Gunjan_Demo
//
//  Created by Harsh Purohit on 27.09.21.
//

import UIKit
import WebKit

class NewsViewController: ParentClass ,WKNavigationDelegate{
    
    @IBOutlet weak var newsView: WKWebView!
    var strUrl : String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string:strUrl)
        let req = URLRequest (url: url!)
        self.newsView!.load(req)
        Utils.showLoading(title:"Loading..")
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Utils.hideLoading()
    }
    
    
}
