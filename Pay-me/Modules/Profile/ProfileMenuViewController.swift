//
//  ProfileMenuViewController.swift
//  payme
//
//  Created by Franco Paredes on 28/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class ProfileMenuViewController:PMViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
 
        let imageLeft = UIImage(named: "ic-perfil")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageLeft,
                                                                style: UIBarButtonItemStyle.plain,
                                                                target: self,
                                                                action: nil)
        
        let imageRight = UIImage(named: "ic-notificacion")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageRight,
                                                                 style: UIBarButtonItemStyle.plain,
                                                                 target: self,
                                                                 action:nil)
//        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;

    }

   

    @IBAction func showCredicards(_ sender: Any) {
        
          self.navigationController?.pushViewController(CreditCardViewController(), animated: true)
    }
    
    @IBAction func showPersonalData(_ sender: Any) {
        
         self.navigationController?.pushViewController(ProfilePersonalViewController(), animated: true)
    }
    
    @IBAction func showSoporte(_ sender: Any) {
        self.navigationController?.pushViewController(SupportViewController(), animated: true)

    }
    @IBOutlet weak var showSecurity: UIButton!
    
}
