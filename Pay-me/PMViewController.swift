//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {

    var keyboardHeigth :CGFloat = 0.0
    var pmheader :PMHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationLogo(isGradient: false)
        initComponents()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PMViewController {
    
    func initHeader(titles :[String]) {
        let width = Int(self.view.frame.width)
        let heigth = Int(self.view.frame.height * 0.065)
        let frame = CGRect(x: 0, y: 50, width: width, height: heigth)
        pmheader = PMHeaderView(frame: frame, titles: titles)
        self.view.addSubview(pmheader)
    }
}

extension PMViewController: PMViewControllerDelegate {
    
    func initComponents() {
        
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

protocol PMViewControllerDelegate {
    func initComponents()
}
