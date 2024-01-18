//
//  LyricWebView.swift
//  LockQuote
//
//  Created by Anastasia on 18/1/24.
//

import SwiftUI
import WebKit

struct LyricWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.allowsLinkPreview = false
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
