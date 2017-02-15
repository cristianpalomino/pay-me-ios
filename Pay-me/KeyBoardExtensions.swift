//
//  KeyBoardExtensions.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension SuministroViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.mainViewTopConstraint.constant = -(self.bigBannerView.frame.height)
                self.consultButtonBottomConstraint.constant = keyboardSize.size.height - 49
                self.errorView?.isHidden = true
                UIView.animate(withDuration: 0.05, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    override func keyboardDidHide() {
        self.consultButtonBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.05, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
