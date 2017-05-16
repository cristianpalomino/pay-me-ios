//
//  RecibosBViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 6/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class RecibosBViewController: PMViewController {
    var index   :Int = 0
    
    @IBOutlet var cBotPin           :NSLayoutConstraint!
    @IBOutlet var txtpin            :UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtpin.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecibosBViewController {
    
    override func initComponents() {
        
    }
}

extension RecibosBViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        super.keyboardDidShow(notification: notification)
        
        if self.cBotPin.constant == 0 {
//            self.cBotPin.constant = keyboardHeigth
            UIView.animate(withDuration: 0.15, animations: {
                self.view.layoutIfNeeded()
            }, completion: {
                (finished :Bool) -> Void in
            })
        }
    }
    
    override func keyboardDidHide() {
        if self.cBotPin.constant != 0 {
            self.cBotPin.constant = 0
            UIView.animate(withDuration: 0.15, animations: {
                self.view.layoutIfNeeded()
            }, completion: {
                (finished :Bool) -> Void in
            })
        }
    }
}
