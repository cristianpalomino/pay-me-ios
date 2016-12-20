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
    @IBOutlet weak var bigBannerHeigth :NSLayoutConstraint!
    @IBOutlet weak var buttonBottomConstraint :NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var txtIndentifier: TextField!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var bigBannerView: UIView!
    @IBOutlet weak var imageBigBannerView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var imageBannerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
        initComponents()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SuministroViewController {
    
    func initComponents() {
        self.bannerView.layer.borderColor = UIColor.darkGray.cgColor
        self.bannerView.layer.borderWidth = 1
        self.bigBannerView.layer.borderColor = UIColor.gray.cgColor
        self.bigBannerView.layer.borderWidth = 1
    }
}

extension SuministroViewController {
    
    @IBAction func tapConsultar() {
        
    }
    
    @IBAction func tapInfo() {
        
    }
}

extension SuministroViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.bigBannerHeigth.constant = 0
                self.buttonBottomConstraint.constant = keyboardSize.size.height - self.tabBarController!.tabBar.frame.size.height
                UIView.animate(withDuration: 0.15, animations: {
                    self.mainView.layoutIfNeeded()
                })
            }
        }
    }
    
    override func keyboardDidHide() {
        print("keyboardDidHide")
    }
}
