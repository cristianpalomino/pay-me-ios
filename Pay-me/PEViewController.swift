//
//  PEViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 29/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

class PEViewController: PMMessageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PEViewController {
    
    override func initComponents() {
        addTouchListener()
    }
}
