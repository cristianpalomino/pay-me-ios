//
//  LaunchViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 06/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showAppFlow), with: self, afterDelay: 0.5)
    }
    
    func showAppFlow(){
        performSegue(withIdentifier: "fromSplashSegue", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
