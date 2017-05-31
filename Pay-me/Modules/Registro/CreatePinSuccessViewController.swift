//
//  CreatePinSuccessViewController.swift
//  payme
//
//  Created by Franco Paredes on 19/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class CreatePinSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        DispatchQueue.main.async {
            let _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
//                self.navigationController?.pushViewController(ProfileMenuViewController(), animated: true)
                
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = PMTabBarController()
                
            }
        }
    }
    func next() {
        // do what should happen when timer triggers an event
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
