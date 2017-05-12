//
//  RecibosAViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 8/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class RecibosAViewController: PMViewController {
    
    @IBOutlet var cBotButtom        :NSLayoutConstraint!
    @IBOutlet var cTopView          :NSLayoutConstraint!
    
    @IBOutlet var bannerView         :UIView!
    @IBOutlet var dataView           :UIView!
    
    @IBOutlet var frameCardView      :UIView!
    
    @IBOutlet var frontCardView      :UIView!
    @IBOutlet var backCardView       :UIView!
    
    @IBOutlet var txtEmision        :PMTextField!
    @IBOutlet var txtVencimiento    :PMTextField!
    
    @IBOutlet var txtNumeroTarjeta  :PMTextField!
    @IBOutlet var txtMes            :PMTextField!
    @IBOutlet var txtAnio           :PMTextField!
    @IBOutlet var txtCvv            :UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecibosAViewController {
    
    override func initComponents() {
        
    }
}

extension RecibosAViewController {
    
    @IBAction func tapPagar() {
        let type = Session.sharedInstance.messageType
        if type == .INVALID_CARD {
//            showMessage(type: .INVALID_CARD)
            Session.sharedInstance.messageType = .NOT_AUTORIZED
        } else if type == .NOT_AUTORIZED {
//            showMessage(type: .NOT_AUTORIZED)
            Session.sharedInstance.messageType = .SUCCESS_PAY
        } else if type == .SUCCESS_PAY {
//            showMessage(type: .SUCCESS_PAY)
            Session.sharedInstance.messageType = .INVALID_CARD
        }
    }
    
    @IBAction func tapFlip() {
        self.frontCardView.isHidden = true
        self.backCardView.isHidden = false
        self.txtCvv.becomeFirstResponder()
    }
}

extension RecibosAViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        super.keyboardDidShow(notification: notification)
        
        if self.cBotButtom.constant == 0 {
            self.cTopView.constant = -(self.frameCardView.frame.origin.y - 8)
//            self.cBotButtom.constant = keyboardHeigth
            UIView.animate(withDuration: 0.15, animations: {
                self.view.layoutIfNeeded()
            }, completion: {
                (finished :Bool) -> Void in
            })
        }
    }
    
    override func keyboardDidHide() {
        if self.cBotButtom.constant != 0 {
            self.cBotButtom.constant = 0
            UIView.animate(withDuration: 0.15, animations: {
                self.view.layoutIfNeeded()
            }, completion: {
                (finished :Bool) -> Void in
            })
        }
    }
}
