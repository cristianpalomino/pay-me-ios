//
//  SupportViewController.swift
//  payme
//
//  Created by Franco Paredes on 11/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class SupportViewController: PMViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func asistantOption(_ sender: Any) {
            self.navigationController?.pushViewController(AssistantViewController(), animated: true)
    }

}
