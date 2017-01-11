//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {

    var keyboardHeigth  :CGFloat = 0.0
    var scroll          :UIScrollView!
    var titles          :[String]!
    
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
    
    @IBAction func tapNotifications() {
        let notis = UIStoryboard.createNotificacionesHome().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
    
    @IBAction func tapPerfil() {
        let notis = UIStoryboard.createNotificaciones().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
}

extension PMViewController {
    
    func initHeader() {
        let py      = view.frame.height * 0.07
        let proph   = view.frame.height * 0.07
        var lx      :CGFloat = 0
        var cs      = CGSize(width: 0, height: proph)
        
        scroll = UIScrollView(frame: CGRect(x: 0, y: py, width: view.frame.width, height: proph))
        scroll.bounces = false
        scroll.backgroundColor = UIColor.white
        
        let mview = UIView(frame: CGRect(x: 0, y: py, width: view.frame.width * 0.95, height: proph * 0.8))
        mview.backgroundColor = UIColor.white
        
        for item in titles {
            let label = PMHeaderButton(frame: .zero, title: item, isFocus: false)
            label.tag = item.hash
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gesture:))))
            label.sizeToFit()
            
            let frame = label.frame
            label.frame = CGRect(x: lx, y: 0, width: frame.size.width + 50, height: proph * 0.5)
            //label.layer.cornerRadius = label.frame.size.height * 0.5
            
            lx = frame.size.width + lx + 50
            cs.width = cs.width + label.frame.width
            
            label.center.y = mview.center.y
            mview.addSubview(label)
        }
        
        scroll.contentSize = cs
        scroll.layer.borderWidth = 1
        scroll.layer.borderColor = UIColor.darkGray.cgColor
        
        if cs.width > view.frame.width {
            mview.frame = CGRect(x: 0, y: py, width: cs.width, height: proph * 0.8)
        } else {
            mview.frame = CGRect(x: 0, y: py, width: view.frame.width * 0.95, height: proph * 0.8)
        }
        
        mview.layer.borderColor = UIColor.lightGray.cgColor
        mview.layer.borderWidth = 1
        mview.layer.cornerRadius = mview.frame.height * 0.5
        mview.center.y = scroll.center.y
        
        scroll.addSubview(mview)
        view.addSubview(scroll)
    }
    
    func tapHeader(gesture :UITapGestureRecognizer) {
        let button = gesture.view! as! PMHeaderButton
        button.setFocusStyle()
        
        let framecenter = CGRect(x: scroll.center.x, y: scroll.center.y, width: button.frame.width, height: button.frame.height)
        self.scroll.scrollRectToVisible(framecenter, animated: true)
    }
}

extension PMViewController: PMViewControllerDelegate {
    
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

protocol PMViewControllerDelegate {
    func initComponents()
}
