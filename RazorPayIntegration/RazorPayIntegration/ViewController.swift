//
//  ViewController.swift
//  RazorPayIntegration
//
//  Created by sanchit on 26/09/19.
//  Copyright © 2019 sanchit. All rights reserved.
//

import UIKit
import Razorpay
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var razorpay :  Razorpay!
    let orderId = "order_DUKEU65WdsjkNT" // should be new for every order use curl command for that
    override func viewDidLoad() {
        super.viewDidLoad()
        //razorPay = Razorpay.initWithKey("rzp_test_4fzYRbu9O8unc1", andDelegate: self)
        self.webView.navigationDelegate = self
        
        
        //razorPay?.authorize(options)
        //razorPay?.openCheckout(dict: options)
    }
    
    @IBAction func PayBtnClicked(_ sender: Any) {
        self.razorpay = nil
         self.razorpay = Razorpay.initWithKey("rzp_test_4fzYRbu9O8unc1", andDelegate: self, withPaymentWebView: webView)
        let options: [String:Any] = [
            "amount": 100, // amount in currency subunits. Defaults to INR. 100 = 100 paise = INR 1. We support more than 92 currencies.
            "currency": "INR",//We support more that 92 international currencies.
            "email": "gaurav.kumar@example.com",
            "contact": "9090980808",
            "order_id": "\(orderId)"
        ]
        razorpay.openCheckout(dict: options)
    }
    
    @IBAction func netBanking(_ sender: Any) {
        self.razorpay = nil
        self.razorpay = Razorpay.initWithKey("rzp_test_4fzYRbu9O8unc1", andDelegate: self, withPaymentWebView: webView)
        let options: [String:Any] = [
            "amount": 100, // amount in currency subunits. Defaults to INR. 100 = 100 paise = INR 1. We support more than 92 currencies.
            "currency": "INR",//We support more that 92 international currencies.
            "email": "gaurav.kumar@example.com",
            "contact": "9090980808",
            "order_id": "\(orderId)",
            "method": "netbanking",
            "bank": "SBIN"
        ]
        razorpay.authorize(options)
    }
    
    @IBAction func upi(_ sender: Any) {
        self.razorpay = nil
        self.razorpay = Razorpay.initWithKey("rzp_test_4fzYRbu9O8unc1", andDelegate: self, withPaymentWebView: webView)
        let options: [String:Any] = [
            "amount": 100, // amount in currency subunits. Defaults to INR. 100 = 100 paise = INR 1. We support more than 92 currencies.
            "currency": "INR",//We support more that 92 international currencies.
            "email": "gaurav.kumar@example.com",
            "contact": "9090980808",
            "order_id": "\(orderId)",
            "method": "upi"
        ]
        razorpay.authorize(options)
    }
    @IBAction func direct(_ sender: Any) {
        self.razorpay = nil
        self.razorpay = Razorpay.initWithKey("rzp_test_4fzYRbu9O8unc1", andDelegate: self, withPaymentWebView: webView)
        let options: [String:Any] = [
            "amount": 100, // amount in currency subunits. Defaults to INR. 100 = 100 paise = INR 1. We support more than 92 currencies.
            "currency": "INR",//We support more that 92 international currencies.
            "email": "gaurav.kumar@example.com",
            "contact": "9090980808",
            "order_id": "\(orderId)",
            "method": "card",
            //"vpa":"test@axisbank"
            //            "method": "card",
            "card[name]": "Gaurav Kumar",
            "card[number]": "4111111111111111",
            "card[expiry_month]": 06,
            "card[expiry_year]": 30,
            "card[cvv]": "123"
        ]
        razorpay.authorize(options)
    }
}


extension ViewController: RazorpayPaymentCompletionProtocol{
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]) {
        print("success")
        self.razorpay = nil
        let alert = UIAlertController(title: "Payment Successful", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]) {
        print("fail")
        let alert = UIAlertController(title: "Payment Failed", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

extension ViewController: WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        if razorpay != nil{
            self.razorpay.webView(webView, didCommit: navigation)
        }
    }
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError er: Error) {
        if razorpay != nil{
            self.razorpay.webView(webView, didFailProvisionalNavigation: navigation, withError: er)
        }
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError er: Error){
        if razorpay != nil{
            self.razorpay.webView(webView, didFail: navigation, withError: er)
        }
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        if razorpay != nil{
            self.razorpay.webView(webView, didFinish: navigation)
        }
    }
}
// curl command
//curl -u rzp_test_4fzYRbu9O8unc1:GkU4xJh8kaUyU97117xAjMgq -X POST https://api.razorpay.com/v1/orders -H "Content-Type: application/json" -d '{"amount": "100","currency":"INR","receipt":"11234567","payment_capture":"0"}'

