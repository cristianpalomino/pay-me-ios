//
//  SMSValidationViewController.swift
//  payme
//
//  Created by Franco Paredes on 11/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class SMSValidationViewController: PMViewController {

    @IBOutlet weak var telephoneTextfield: UITextField!
    @IBOutlet weak var sendSMSButton: UIButton!
    @IBOutlet weak var phoneNumberView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.hideKeyboardWhenTappedAround()
        
    }
 

  

    @IBAction func sendSMS(_ sender: Any) {
        
    }
    
    func moveForm(positionY val:Float) -> Void{
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        
                        self.phoneNumberView.frame.origin.y = CGFloat(val)
                        
        }, completion: { (finished) -> Void in   })
    }
    //This is for the keyboard to GO AWAYY !! when user clicks "Return" key  on the keyboard
}

// MARK: - UITextFieldDelegate
extension SMSValidationViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool // return NO to not change text
    {
        
        let maxLength = 6
        
        if (textField == self.telephoneTextfield){
            let currentStringPIN1: NSString = self.telephoneTextfield.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            let isCountPIN1Ok =  newStringPIN1.length <= maxLength
            
            if(isCountPIN1Ok){
               if newStringPIN1.length == 6{
                    print(newStringPIN1)
                    self.navigationController?.pushViewController(CreatePinViewController(), animated: true)
                   
                }
                return true
            } else { // mas de 4 elementos
                return false
            }
        }
               
        return false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        moveForm(positionY: 135)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        // moveForm(positionY: 229)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool  {
         moveForm(positionY: 230)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        moveForm(positionY: 230)
        view.endEditing(true)
       // registerUser()
        return true
    }
    
}
