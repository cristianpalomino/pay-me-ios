//
//  CreditCardDetailViewController.swift
//  payme
//
//  Created by Franco Paredes on 8/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit
import Stripe
import CreditCardForm

class CreditCardDetailViewController: PMViewController, STPPaymentCardTextFieldDelegate  {

    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var creditCardView: CreditCardFormView!
    let paymentTextField = STPPaymentCardTextField()
    var parentViewName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        creditCardView.cardHolderString = "Payme Card"
        self.hideKeyboardWhenTappedAround()
        createTextField()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if (parentViewName == "ticket")
        {
            print("tricket padre")
            addCardButton.removeTarget(nil, action: nil, for: .allEvents)
            addCardButton.addTarget(self, action: #selector(self.payTicket), for: .touchUpInside)

            addCardButton.setTitle("  Pagar recibo", for: UIControlState.normal)
            addCardButton.setImage(UIImage(named:"icono-pagar-recibo"), for: UIControlState.normal)
        }else{
            
            print("createcard padre")
            addCardButton.removeTarget(nil, action: nil, for: .allEvents)
            addCardButton.addTarget(self, action: #selector(self.addCardRegister), for: .touchUpInside)

            addCardButton.setTitle("  Agregar tarjeta", for: UIControlState.normal)
            addCardButton.setImage(UIImage(named:"icono-agregar-tarjeta"), for: UIControlState.normal)
        }
    }
    
    func setUI() -> Void{
        addCardButton.setGradientBackground()
    }
    
    func createTextField() {
        paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width - 30, height: 44)
        paymentTextField.delegate = self
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        paymentTextField.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 18)
        
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)
        
        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: creditCardView.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        
        creditCardView.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationYear, cvc: textField.cvc)
        
       
        let cardcvc = String(describing: textField.cvc)
       
 
       if (cardcvc != "nil" ){
            let cardcvcdata: NSString = textField.cvc! as NSString
            if cardcvcdata.length == 3
            {
                print("fin del intro")
                print(cardcvcdata)
                creditCardView.paymentCardTextFieldDidEndEditingCVC()
                view.endEditing(true)
            }
       }
        
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
        print("fin de EXPIRA")
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingCVC()
        listData.append("Banco de Crédito del Perú")
       }
    @IBAction func payTicket(_ sender: Any) {
        self.navigationController?.pushViewController(ResultViewController(), animated: true)
    }

    @IBAction func addCardRegister(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
