//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Material

class SuministroViewController: PMViewController {
    
    @IBOutlet weak var bigImageBannerHeigth         :NSLayoutConstraint!
    @IBOutlet weak var bigBannerHeigth              :NSLayoutConstraint!
    @IBOutlet weak var bigImageBannerTopConstraint  :NSLayoutConstraint!
    @IBOutlet weak var buttonBottomConstraint       :NSLayoutConstraint!
    
    @IBOutlet weak var viewOpenInfo         : UIView!
    @IBOutlet weak var viewInfo             : UIView!
    
    @IBOutlet weak var mainView             : UIView!
    @IBOutlet weak var txtIndentifier       : PMTextField!
    @IBOutlet weak var btnInfo              : UIButton!
    @IBOutlet weak var bigBannerView        : UIView!
    @IBOutlet weak var imageBigBannerView   : UIImageView!
    @IBOutlet weak var bannerView           : UIView!
    @IBOutlet weak var imageBannerView      : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SuministroViewController {
    
    override func initComponents() {
        self.txtIndentifier.setPMTheme()
    }
}

extension SuministroViewController {
    
    @IBAction func tapConsultar() {
        let identifier = txtIndentifier.text!.trimmed
        if identifier != "" {
            
        } else {
            
        }
    }
    
    @IBAction func tapInfo() {
        showInformation()
    }
}

extension SuministroViewController {
    
    func showInformation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.viewOpenInfo.isHidden = true
            self.viewInfo.isHidden = false
        })
    }
}

extension SuministroViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.bigImageBannerTopConstraint.constant = -self.imageBigBannerView.frame.height
                self.bigImageBannerHeigth.constant = 0
                self.buttonBottomConstraint.constant = keyboardSize.size.height - self.tabBarController!.tabBar.frame.size.height
                UIView.animate(withDuration: 0.15, animations: {
                    self.mainView.layoutIfNeeded()
                })
            }
        }
    }
    
    override func keyboardDidHide() {
        
    }
}
