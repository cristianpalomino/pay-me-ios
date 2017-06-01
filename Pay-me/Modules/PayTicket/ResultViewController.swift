//
//  ResultViewController.swift
//  payme
//
//  Created by Franco Paredes on 17/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        DispatchQueue.main.async {
            let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
               
                self.navigationController?.pushViewController(PayTicketResultViewController(), animated: true)
                
            }
        }

        // Do any additional setup after loading the view.
    }

    
}
