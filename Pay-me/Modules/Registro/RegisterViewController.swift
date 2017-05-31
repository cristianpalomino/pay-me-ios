//
//  RegisterViewController.swift
//  payme
//
//  Created by Analista ios on 5/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class RegisterViewController: PMViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cellPhoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var acceptButton: UIButton!
    
    
    
    /// Esta variable **Mueve hacia arriba** el view que contiene el formulario.
    let posYUpPositionForm:Float = 38
    /// Esta variable **Mueve a la posicion normal** contenedor del formulario.
    let posYNormalPositionForm:Float = 167
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       initUI()
    }

    func initUI()-> Void  {
        self.navigationController?.isNavigationBarHidden = false
        self.hideKeyboardWhenTappedAround()
        
        self.nextButton.isHidden = true
        self.nextButton.setGradientBackground()
        // Do any additional setup after loading the view.

    }
  
    var aceptarAcuerdo : Bool = false
    @IBAction func aceptoAcuerdo(_ sender: Any) {
        acceptButton.isSelected = !acceptButton.isSelected
        nextButton.isHidden = !acceptButton.isSelected
       aceptarAcuerdo = !aceptarAcuerdo
        
    }
    
    func moveForm(positionY val:Float) -> Void{
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        self.formView.frame.origin.y = CGFloat(val)
                        
        }, completion: { (finished) -> Void in   })
    }
    
    @IBAction func showInfo(_ sender: Any) {
        self.navigationController?.pushViewController(TermAndConditionViewController(), animated: true)
    }
    
    @IBAction func registerUser(_ sender: Any) {
           self.navigationController?.pushViewController(SMSValidationViewController(), animated: true)
    }
   
}

// MARK: - UITextFieldDelegate
extension RegisterViewController:UITextFieldDelegate
{
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool // return NO to not change text
    {
        
        let maxLengthName =  20
        let minLengthName =  2
        let maxLengthCell =  9
        let minLengthCell =  8
        
        if textField  == nameTextField
        {
            
            let currentStringPIN1: NSString = self.nameTextField.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            
            if(newStringPIN1.length <= maxLengthName) {
                
                if newStringPIN1.length <= minLengthName {
                    self.nameTextField.textColor = UIColor(hexColor: "#dE4453")
                    //  self.nameImageView.isHighlighted = false
                }else
                {
                    //self.nameTextField.isHighlighted = true
                    self.nameTextField.textColor = UIColor(hexColor: "#434A54")
                }
                return true
            } else { // mas de 4 elementos
                // self.nameImageView.isHighlighted = false
                //  self.nameTextField.textColor = UIColor(hexColor: "#dE4453")
                return false
            }
            
            
        }else   if  textField  == lastnameTextField
        {
            
            let currentStringPIN1: NSString = self.lastnameTextField.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            
            if(newStringPIN1.length <= maxLengthName) {
                
                if newStringPIN1.length <= minLengthName {
                    //   self.lasnameCheckImageView.isHighlighted = false
                    self.lastnameTextField.textColor = UIColor(hexColor: "#dE4453")
                }else
                {
                    // self.lasnameCheckImageView.isHighlighted = true
                    self.lastnameTextField.textColor = UIColor(hexColor: "#434A54")
                }
                return true
                
            } else { // mas de 4 elementos
                //self.lasnameCheckImageView.isHighlighted = false
                // self.lasnameTextfield.textColor = UIColor(hexColor: "#dE4453")
                return false
            }
            
        }else   if  textField  == cellPhoneTextField
        {
            
            let currentStringPIN1: NSString = self.cellPhoneTextField.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            
            if(newStringPIN1.length <= maxLengthCell) {
                
                if newStringPIN1.length <= minLengthCell {
                    //   self.lasnameCheckImageView.isHighlighted = false
                    self.cellPhoneTextField.textColor = UIColor(hexColor: "#dE4453")
                }else
                {
                    // self.lasnameCheckImageView.isHighlighted = true
                    self.cellPhoneTextField.textColor = UIColor(hexColor: "#434A54")
                }
                return true
                
            } else { // mas de 4 elementos
                //self.lasnameCheckImageView.isHighlighted = false
                // self.lasnameTextfield.textColor = UIColor(hexColor: "#dE4453")
                return false
            }
            
        }

        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.
    {
        moveForm(positionY:  self.posYUpPositionForm)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    {
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        
        if textField  == cellPhoneTextField   {
            self.nameTextField.becomeFirstResponder()
        }else if textField == nameTextField  {
            self.lastnameTextField.becomeFirstResponder()
        } else if textField == lastnameTextField
        {
            self.lastnameTextField.resignFirstResponder()
            moveForm(positionY: posYNormalPositionForm)
            view.endEditing(true)
        }
        return true
    }
}
