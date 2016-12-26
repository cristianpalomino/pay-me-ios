//
//  DetalleSuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class DetalleSuministroViewController: PMViewController {

    @IBOutlet weak var txtIndentifier       : PMTextField!
    @IBOutlet weak var txtName              : PMTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetalleSuministroViewController {
    
    override func initComponents() {
        self.txtIndentifier.setPMTheme()
        self.txtName.setPMTheme()
    }
}
