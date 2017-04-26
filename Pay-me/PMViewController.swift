//
//  PMViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMViewController: UIViewController {
    
    var keyboardHeigth  :CGFloat = 0.0
    @IBOutlet weak var pmTitleView: PMTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initComponents()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addBorders()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

