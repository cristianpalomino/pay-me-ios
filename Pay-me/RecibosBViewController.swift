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
    
    @IBOutlet var pina            :PMPin!
    @IBOutlet var pinb            :PMPin!
    @IBOutlet var pinc            :PMPin!
    @IBOutlet var pind            :PMPin!
    
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
        addTextFieldDelegate()
        addPinNormalStyles()
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

extension RecibosBViewController {
    
    func addTextFieldDelegate() {
        txtpin.delegate = self
        txtpin.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        let array = Array(textField.text!.characters)
        if let _ = array.last {
            let pins = [pina, pinb, pinc, pind]
            addPinStyle(view: pins[array.count - 1])
        }
    }
    
    func addPinNormalStyles() {
        let pins = [pina, pinb, pinc, pind]
        for p in pins {
            p!.layer.borderColor = UIColor.appGrayColor().cgColor
            p!.layer.cornerRadius = p!.frame.size.height * 0.5
            p!.layer.borderWidth = 1
        }
    }
    
    func addPinStyle(view :PMPin?) {
        if let v = view {
            if !v.isTypeed {
                v.layer.backgroundColor = UIColor.appBlueColor().cgColor
                v.isTypeed = true
            }
            else {
                v.layer.backgroundColor = UIColor.appGrayColor().cgColor
                v.isTypeed = false
            }
        }
    }
}

extension RecibosBViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = range.range(for: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.characters.count <= 4
    }
}
