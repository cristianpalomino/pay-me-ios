//
//  PinViewController.swift
//  payme
//
//  Created by Franco Paredes on 24/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class PMPinView: UIView {

    @IBOutlet weak var pinTextfield: UITextField!
    @IBOutlet weak var ingresaLabel: UILabel!
    
    @IBOutlet var pindotButton: [UIButton]!
    let pincorrect:NSString = "1234"
    
    func initUI() {
        pinTextfield.becomeFirstResponder()
    }
    
    class func instanceFromNib() -> PMPinView {
        return UINib(nibName: "PinView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMPinView
    }
    
    // MARK: - UITextField Validations
    
    func validatePin(pin p:NSString)-> Void{
        if(p == pincorrect){
            self.ingresaLabel.textColor  =  UIColor(hexColor: "#a0d468")
            self.ingresaLabel.text = "¡PIN correcto!"
            // TODO: Modificar el destino
            // self.navigationController?.pushViewController(ResultViewController(), animated: true)
        }else {
            self.ingresaLabel.textColor  =  UIColor(hexColor: "#da4453")
            self.ingresaLabel.text="PIN incorrecto, intentalo nuevamente."
           
            for index in 0...3 { 
                self.pindotButton[index].setImage(UIImage(named:"input-pin-error"), for: UIControlState.normal)
                 self.pindotButton[index].isSelected = false
            }
            self.pinTextfield.text = ""
            
        }
    
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        let pinString = self.pinTextfield.text! as NSString
        // FIXME: Chekar la secuencia.
        for index in -1...pinString.length-1 {
            if(index >= 0){
                self.pindotButton[index].isSelected = true
            }
        }
        if (pinString.length == 4){
            validatePin(pin: pinString)
        }else  {
            self.ingresaLabel.textColor  =  UIColor(hexColor: "#434A45")
            self.ingresaLabel.text = "Ingresa tu PIN"
        }
    }

}

 // MARK: - UITextFieldDelegate

extension PMPinView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool // return NO to not change text 
    {
        let maxLength = 4
        if (textField == self.pinTextfield) {
            let currentStringPIN1: NSString = self.pinTextfield.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            let isCountPIN1Ok =  newStringPIN1.length <= maxLength
            if(isCountPIN1Ok){
                return true
            } else { // mas de 4 elementos
                return false
            }
        }
        return false
    }
}

