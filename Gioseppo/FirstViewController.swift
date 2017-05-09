//
//  FirstViewController.swift
//  Gioseppo
//
//  Created by Santiago Navarro Ruiz on 22/3/17.
//  Copyright © 2017 Santiago Navarro Ruiz. All rights reserved.
//

import UIKit
import SMWebView
import CoreLocation
import Spring

class FirstViewController: UIViewController, UIWebViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var appWebView: SMWebView!
    
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadWebViewWithURL(url: "http://app.gioseppo.com")
        appWebView.scrollView.bounces = false
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }
    
    func loadWebViewWithURL(url: String){
        appWebView
            .loadURL(URL(string: url)!)
            .didStartLoading { webView in
//                print("Started loading \(webView.request?.url?.absoluteString)")
//                self.loading.startAnimating()
                self.view.showLoading()
            }
            .didFinishLoading { webView in
//                print("Finished loading \(webView.request?.url?.absoluteString)")
//                self.loading.stopAnimating()
                self.view.hideLoading()
            }
            .didFailLoading { webView, error in
//                print("Failed loading \(error)")
//                self.loading.stopAnimating()
                self.view.hideLoading()
            }
            .didCompleteLoading { webView in
//                print("Finished loading entire webpage")
//                self.loading.stopAnimating()
                self.view.hideLoading()
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
//        self.loadWebViewWithURL(url: "http://app.gioseppo.com/en/campanyas/?v=123456789")
        self.loadWebViewWithURL(url: "http://gioseppo.com/es-es/campana")
    }
    
    @IBAction func btnLocationTapped(_ sender: Any) {
//        self.loadWebViewWithURL(url: "http://app.gioseppo.com/en/shops_/")
        self.loadWebViewWithURL(url: "http://gioseppo.com/es-es/puntos-de-venta-gioseppo")
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

    //MARK: Location delegate mthods
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error.localizedDescription)")
        let errorAlert = UIAlertView(title: "Error", message: "Failed to Get Your Location", delegate: nil, cancelButtonTitle: "Ok")
        errorAlert.show()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("current position: \(newLocation.coordinate.longitude) , \(newLocation.coordinate.latitude)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let newLocation = locations.last as! CLLocation
        print("current position: \(newLocation.coordinate.longitude) , \(newLocation.coordinate.latitude)")
    }
}

