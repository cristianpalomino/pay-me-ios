//
//  PayTicketResultViewController.swift
//  payme
//
//  Created by Franco Paredes on 17/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class PayTicketResultViewController: PMViewController {

   
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        initView()
          // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUI()
    {
        self.navigationController?.isNavigationBarHidden = false
        //self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.setTabBarVisible(visible: true, duration: 0.5, animated: true)

        
        registerButton.setGradientBackground()
    }
    
    func initView()
    {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
