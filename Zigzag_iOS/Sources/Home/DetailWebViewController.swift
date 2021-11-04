//
//  DetailWebViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/04.
//

import UIKit
import WebKit

class DetailWebViewController: UIViewController {
    var webView: WKWebView?
    var popupWebView: WKWebView?
    var urlString: String? = "https://s.zigzag.kr/UnyvPHHH3R"
    var navbarTitle: String?

    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: view.frame)
        if let webview = webView {
            view = webview
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        loadWeb()
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_left.png"), style: .plain, target: self, action: #selector(backToPreviousViewController))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = navbarTitle ?? ""
    }

    @objc private func backToPreviousViewController() {
        navigationController?.popViewController(animated: true)
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
