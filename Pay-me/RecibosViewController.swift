//
//  RecibosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class RecibosViewController: PMViewController {
    
    var cardIsBack :Bool = false
    
    @IBOutlet var ycardViewBottom    :NSLayoutConstraint!
    @IBOutlet var yButtonBottom      :NSLayoutConstraint!
    
    @IBOutlet var btnPay             :PMButton!
    @IBOutlet var bannerView         :UIView!
    @IBOutlet var dataView           :UIView!
    
    @IBOutlet var frameCardView      :UIView!
    @IBOutlet var frontCardView      :UIView!
    @IBOutlet var backCardView       :UIView!
    
    @IBOutlet var vEmision          :UIView!
    @IBOutlet var vVencimiento      :UIView!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecibosViewController {
    
    override func initComponents() {
        txtEmision.setPMTheme()
        txtVencimiento.setPMTheme()
        txtNumeroTarjeta.setPMTheme()
        txtMes.setPMTheme()
        txtAnio.setPMTheme()
    }
}

extension RecibosViewController {
    
    @IBAction func tapPagar() {
        if self.frameCardView.isHidden {
            self.frameCardView.isHidden = false
        } else {
            if cardIsBack {
                let type = Session.sharedInstance.messageType
                if type == .INVALID_CARD {
                    showMessage(type: .INVALID_CARD)
                    Session.sharedInstance.messageType = .NOT_AUTORIZED
                } else if type == .NOT_AUTORIZED {
                    showMessage(type: .NOT_AUTORIZED)
                    Session.sharedInstance.messageType = .SUCCESS_PAY
                } else if type == .SUCCESS_PAY {
                    showMessage(type: .SUCCESS_PAY)
                    Session.sharedInstance.messageType = .INVALID_CARD
                }
            } else {
                tapFlip()
            }
        }
    }
    
    @IBAction func tapFlip() {
        self.frontCardView.isHidden = true
        self.backCardView.isHidden = false
        self.txtCvv.becomeFirstResponder()
        self.cardIsBack = true
    }
}

extension RecibosViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        super.keyboardDidShow(notification: notification)
        
        var framecard = frameCardView.frame
        framecard.origin.y = 8
        frameCardView.frame = framecard
        
        var framebutton = btnPay.frame
        print(framebutton)
        if !btnPay.isUp {
            framebutton.origin.y = framebutton.origin.y - keyboardHeigth
            btnPay.frame = framebutton
            btnPay.isUp = true
            
            UIView.animate(withDuration: 0.25, animations: {
                self.bannerView.isHidden = true
                self.dataView.isHidden = true
                self.frameCardView.layoutIfNeeded()
            })
        } else {
            if self.cardIsBack {
                framebutton.origin.y = framebutton.origin.y + keyboardHeigth
                btnPay.frame = framebutton
                btnPay.isUp = false
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.bannerView.isHidden = true
                    self.dataView.isHidden = true
                    self.frameCardView.layoutIfNeeded()
                })
            }
        }
    }
    
    override func keyboardDidHide() {
        
    }
}
