//
//  ExtensionPMViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 18/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation

extension PMViewController {
    
    var headerTitle: String { return "NONE" }
    
    @IBAction func tapPerfil() {
        let notis = UIStoryboard.createNotificaciones().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
    
    @IBAction func tapNotifications() {
        let notis = UIStoryboard.createNotificacionesHome().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
    
    func tapBack() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func tapSearch() {
        print("tapSearch")
    }
}

extension PMViewController {
    
    func initComponents() {
        self.pmTitleView.pmViewController = self
        self.addNavigationLogo(isGradient: false)
        self.setTitle()
    }
    
    func addBorders() {
        
    }
    
    func setTitle() {
        self.pmTitleView.titleLabel.text = self.headerTitle
    }
    
    func showMessage(type :MessageType) -> UINavigationController {
        Session.sharedInstance.messageType = type
        let message = UIStoryboard.createMessage()
        self.present(message, animated: true, completion: nil)
        return message
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
