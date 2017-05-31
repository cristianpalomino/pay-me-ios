//
//  PMTextField.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMTextField: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rigthView: UIImageView!
    @IBOutlet weak var leftView: UIImageView!
    
    func initUI() {
        hiddens()
        defaultRigth()
    }
    
    func hiddens() {
        indicator.isHidden = true
        rigthView.isHidden = false
        leftView.isHidden = true
    }
    
    func defaultRigth() {
        rigthView.layer.cornerRadius = rigthView.frame.height * 0.5
        rigthView.backgroundColor = UIColor(hexColor: "#3da4fe")
    }
    
    class func instanceFromNib() -> PMTextField {
        return UINib(nibName: "TextField",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMTextField
    }
}
