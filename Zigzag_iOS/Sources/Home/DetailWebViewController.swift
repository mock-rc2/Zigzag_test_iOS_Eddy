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
    var urlString: String? = "https://s.zigzag.kr/UnyvPHHH3R"
    static var navbarTitle: String?
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var purchaseButton: UIButton!
    
//    private let webToolBar: UIToolbar = {
//        let toolbar = UIToolbar()
//        toolbar.backgroundColor = .white
//        toolbar.sizeToFit()
//        return toolbar
//    }()

//    override func loadView() {
//        super.loadView()
//        webView = WKWebView(frame: view.frame)
//        if let webview = webView {
//            view = webview
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setPurchaseButton()
        toolbar.sizeToFit()
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
        backButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let storeImgButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        storeImgButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        storeImgButton.tintColor = .lightGray
        storeImgButton.imageView?.contentMode = .scaleAspectFill
        
        let storeButton = UIButton(type: .system)
        storeButton.setTitle(DetailWebViewController.navbarTitle, for: .normal)
        storeButton.setTitleColor(.black, for: .normal)
        storeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let starButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        starButton.tintColor = .black
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        let storeImgBarButtonItem = UIBarButtonItem(customView: storeImgButton)
        let storeBarButtonItem = UIBarButtonItem(customView: storeButton)
        let starBarButtonItem = UIBarButtonItem(customView: starButton)
        self.navigationItem.leftBarButtonItems = [
            backBarButtonItem, storeImgBarButtonItem, storeBarButtonItem, starBarButtonItem]
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        self.navigationItem.rightBarButtonItems = [cartBarButtonItem, searchBarButtonItem]
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
