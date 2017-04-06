//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {
    
    @IBOutlet weak var titleView            :UIView!
    @IBOutlet weak var titleLabel           :UILabel!
    
    var keyboardHeigth  :CGFloat = 0.0
    var scroll          :UIScrollView!
    var titles          :[String] = ["One", "Two", "Three", "Four", "Five", "Six"]
    
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
        let titles = [
            ("Pagado", UIColor.gray, true),
            ("Pasado", UIColor.purple, false),
            ("Retrasos", UIColor.brown, false),
            ("No cancelado", UIColor.blue, false),
            ("Become", UIColor.red, false)
        ]
        
        let width = self.view.frame.width
        let heigth = self.view.frame.height
        
        let scroll_frame = CGRect(x: 0, y: heigth * 0.1, width: width, height: heigth * 0.08)
        self.scroll = UIScrollView(frame: scroll_frame)
        self.scroll.backgroundColor = UIColor.clear
        self.view.addSubview(scroll)
        
        let inside_view = UIView(frame: .zero)
        inside_view.backgroundColor = UIColor.clear
        inside_view.layer.borderColor = UIColor.gray.cgColor
        inside_view.layer.borderWidth = 0.5
        
        self.scroll.bounces = false
        self.scroll.isPagingEnabled = true
        self.scroll.showsHorizontalScrollIndicator = false
        self.scroll.addSubview(inside_view)
        
        let padding = Int(width * 0.25)
        var cx :Int = padding
        
        for title in titles {
            
            let title_view = PMHeaderButton(frame: .zero)
            title_view.setTitle(title.0, for: .normal)
            title_view.sizeToFit()
            title_view.titleLabel?.textAlignment = .center
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gesture:)))
            title_view.addGestureRecognizer(gesture)
            
            if title.2 {
                title_view.backgroundColor = title.1
                title_view.setTitleColor(UIColor.white, for: .normal)
            } else {
                title_view.backgroundColor = UIColor.white
                title_view.setTitleColor(UIColor.gray, for: .normal)
            }
            
            let frame_view = CGRect(x: cx, y: 0, width: Int(title_view.frame.width + 100), height: Int(scroll_frame.height * 0.55))
            title_view.frame = frame_view
            
            cx = cx + Int(frame_view.width)
            
            let inside_frame = CGRect(x: 16, y: 0, width: cx, height: Int(scroll_frame.height * 0.75))
            inside_view.layer.cornerRadius = inside_frame.height * 0.5
            inside_view.frame = inside_frame
            inside_view.center.y = scroll_frame.height * 0.5
            
            inside_view.addSubview(title_view)
            
            title_view.center.y = inside_frame.height * 0.5
            title_view.layer.cornerRadius = frame_view.height * 0.5
        }
        
        let endview = UIView(frame: CGRect(x: cx, y: 0, width: padding, height: Int(scroll_frame.height * 0.75)))
        inside_view.addSubview(endview)
        
        let frame = CGRect(x: inside_view.frame.origin.x,
                           y: inside_view.frame.origin.y,
                           width: CGFloat(Int(inside_view.frame.width) + padding),
                           height: inside_view.frame.height)
        inside_view.frame = frame
        
        self.scroll.contentSize.width = CGFloat(cx + 32 + padding)
    }
    
    func tapHeader(gesture :UITapGestureRecognizer) {
        
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
