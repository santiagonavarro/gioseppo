//
//  FirstViewController.swift
//  Gioseppo
//
//  Created by Santiago Navarro Ruiz on 22/3/17.
//  Copyright © 2017 Santiago Navarro Ruiz. All rights reserved.
//

import UIKit
import SMWebView

class FirstViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var appWebView: SMWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadWebViewWithURL(url: "http://app.gioseppo.com")
        appWebView.scrollView.bounces = false
    }
    
    func loadWebViewWithURL(url: String){
        appWebView
            .loadURL(URL(string: url)!)
            .didStartLoading { webView in
                print("Started loading \(webView.request?.url?.absoluteString)")
                self.loading.startAnimating()
            }
            .didFinishLoading { webView in
                print("Finished loading \(webView.request?.url?.absoluteString)")
                self.loading.stopAnimating()
            }
            .didFailLoading { webView, error in
                print("Failed loading \(error)")
                self.loading.stopAnimating()
            }
            .didCompleteLoading { webView in
                print("Finished loading entire webpage")
                self.loading.stopAnimating()
            }
            .shouldStartLoading { webView, request, type in
                return true
        }
    }
    
//    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//        print("Webview Loading error \(error.localizedDescription)")
//    }
//    
//    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        return true;
//    }
    
    @IBAction func btnAccountTapped(_ sender: Any) {
        self.loadWebViewWithURL(url: "http://gioseppo.com/es-es/customer/account/login/")
    }
    
    @IBAction func btnShopTapped(_ sender: Any) {
        self.loadWebViewWithURL(url: "http://gioseppo.com/es-es/")
    }
    
    @IBAction func btnCampaign(_ sender: Any) {
        self.loadWebViewWithURL(url: "http://app.gioseppo.com/en/campanyas/?v=123456789")
    }
    
    @IBAction func btnLocationTapped(_ sender: Any) {
        self.loadWebViewWithURL(url: "http://app.gioseppo.com/en/tiendas/")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init() {
        //Calling the designated initializer of same class
        self.init(nibName: "FirstViewController", bundle: nil)
        //initializing the view Controller form specified NIB file
    }

}

