//
//  DetailWebViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/04.
//

import UIKit
import WebKit

class DetailWebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var popupWebView: WKWebView?
    var urlString: String? = "https://66girls.co.kr/product/%EB%AC%B4%EB%A3%8C%EB%B0%B0%EC%86%A1-%ED%8F%AC%EA%B7%BC%EC%9A%B8%EC%86%8C%EB%A7%A4%EB%B2%84%ED%8A%BCcd/118702/category/50/display/1/"
    @IBOutlet weak var purchaseButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setPurchaseButton()
        loadWeb()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    func webViewDidClose(_ webView: WKWebView) {
        webView.removeFromSuperview()
        popupWebView = nil
    }

    func loadWeb() {
        if let webview = webView {
            webview.uiDelegate = self
            webview.navigationDelegate = self
            webview.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true

            if let urlstring = urlString {
                guard let url = URL(string: urlstring) else { return }
                let request = URLRequest(url: url)
                webview.load(request)
            }
        }
    }

    private func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        let zigzagButton = UIButton(type: .system)
        zigzagButton.setImage(UIImage(systemName: "z.circle"), for: .normal)
        zigzagButton.tintColor = .black
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        
        let zigzagBarButtonItem = UIBarButtonItem(customView: zigzagButton)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        self.navigationItem.rightBarButtonItems = [cartBarButtonItem, searchBarButtonItem, zigzagBarButtonItem]
    }
    
    func setPurchaseButton() {
        purchaseButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        purchaseButton.clipsToBounds = true
        purchaseButton.layer.cornerRadius = 20
    }
    
    @objc func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailWebViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for _: WKNavigationAction, windowFeatures _: WKWindowFeatures) -> WKWebView? {
        popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
        popupWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView?.navigationDelegate = self
        popupWebView?.uiDelegate = self
        if let popupWebView = popupWebView {
            view.addSubview(popupWebView)
        }
        return popupWebView
    }
}
