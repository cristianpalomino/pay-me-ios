//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {

    @IBOutlet weak var pmTitleView: PMTitleView!
    var keyboardHeigth  :CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationLogo(isGradient: false)
        initComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMViewController {
    
    func initComponents() {
        addBottomBorder()
    }
    
    func addBottomBorder() {
        let border = CALayer()
        border.backgroundColor = UIColor.appGrayColor().cgColor
        border.frame = CGRect(x: 0, y: self.view.frame.size.height - 0.5, width: self.view.frame.size.width, height: 0.5)
        self.view.layer.addSublayer(border)
    }
    
    func showMessage(type :MessageType) {
        Session.sharedInstance.messageType = type
        let message = UIStoryboard.createMessage()
        self.present(message, animated: true, completion: nil)
    }
}

extension PMViewController {
    
    func addKeyBoardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide), name: .UIKeyboardDidHide, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.keyboardHeigth = keyboardSize.size.height
            }
        }
    }
    
    func keyboardDidHide() {
        
    }
}
