import WebKit
import UIKit

class NavigationDelegate: NSObject, WKNavigationDelegate {
    let allowedSites = ["apple.com", "hackingwithswift.com"]
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            } else {
                print("Disallowed invalid site: \(host).")
            }
        }
        
        decisionHandler(.cancel)
    }
}
