//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    internal var startPoint: CGPoint {
        return CGPoint(x: 0, y: 35)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBar()
        initComponents()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension PMViewController {
    
    var headerTitle: String { return "NONE" }
    
    @IBAction func tapPerfil() {
        //let notis = UIStoryboard.createNotificaciones().topViewController!
        //self.navigationController?.show(notis, sender: self)
    }
    
    @IBAction func tapNotifications() {
        //let notis = UIStoryboard.createNotificacionesHome().topViewController!
        //self.navigationController?.show(notis, sender: self)
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
        addNavigationLogo(isGradient: false)
    }
    
    func addBar() {
        let bar = PMBarView.instanceFromNib()
        bar.title(headerTitle)
        view.addSubview(bar)
    }
    
    func add(mainView: UIView) {
        mainView.frame.origin = startPoint
        mainView.frame.size = CGSize(width: container.frame.size.width, height: container.frame.size.height - 35)
        container.addSubview(mainView)
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidShow),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidHide),
                                               name: .UIKeyboardDidHide,
                                               object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                //self.keyboardHeigth = keyboardSize.size.height
            }
        }
    }
    
    func keyboardDidHide() {
        
    }
}
