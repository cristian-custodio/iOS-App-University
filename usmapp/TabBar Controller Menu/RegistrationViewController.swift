//
//  RegistrationViewController.swift
//  usmapp
//
//  Created by Cristian Custodio on 4/9/18.
//  Copyright © 2018 Cristian Custodio and Steve Toro. All rights reserved.
//

import UIKit
import WebKit

class RegistrationViewController: UIViewController, UIWebViewDelegate {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var studentRegistrationForm: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Declare UIWebView as Delegate
        studentRegistrationForm.delegate = self
        
        //Enumerate Indicator
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        //Load Registration URL
        let url = URLRequest(url: URL(string: "https://fs2.formsite.com/universitykingjesusministryorg/form2/")!)
        studentRegistrationForm.loadRequest(url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Stop Indicator once webpage loads
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        print("indicator Stopped")
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }

}
