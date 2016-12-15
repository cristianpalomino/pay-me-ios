//
//  PMNavigationViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 15/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBarLogo()
        // Do any additional setup after loading the view.
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

extension PMNavigationViewController {
    
    func addNavigationBarLogo() {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo"))
    }
}

extension UIViewController {
    
    @IBAction func tapBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
