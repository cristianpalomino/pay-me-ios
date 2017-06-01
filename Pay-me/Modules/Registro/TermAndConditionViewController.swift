//
//  TermAndConditionViewController.swift
//  payme
//
//  Created by Franco Paredes on 11/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class TermAndConditionViewController: PMViewController,UIWebViewDelegate {
 
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var progress: UIProgressView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.navigationController?.isNavigationBarHidden = true
        
        
         self.webview.delegate = self
        if let url = URL(string:  "http://www.pay-me.com.pe/terminos_condiciones.html") {
            let request = URLRequest(url: url)
             self.webview.loadRequest(request)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func webViewDidStartLoad(_ webView: UIWebView) {
          self.progress.isHidden = false
        self.progress.setProgress(0.1, animated: false)
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        self.progress.setProgress(1.0, animated: true)
        self.progress.isHidden = true
    }
    
    private func webView(_ webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        self.progress.setProgress(1.0, animated: true)
        self.progress.isHidden = true
    }
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
