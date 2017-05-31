//
//  AssistantViewController.swift
//  payme
//
//  Created by Franco Paredes on 15/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit
import MessageUI

class AssistantViewController: PMViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func writeMe(_ sender: Any) {
        let subject = "Ayuda Payme"
        let body = " "
        let coded = "mailto:soporte@pay-me.pe?subject=\(subject)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let emailURL: NSURL = NSURL(string: coded!) {
            if UIApplication.shared.canOpenURL(emailURL as URL) {
                UIApplication.shared.openURL(emailURL as URL)
            }
        }
    }

    @IBAction func callMe(_ sender: Any) {
        let phoneNum = "990134664"
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    @IBAction func contactMe(_ sender: Any) {
        if let url = URL(string: "http://pay-me.com.pe/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
 
    
}
