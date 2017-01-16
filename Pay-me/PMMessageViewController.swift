//
//  PMMessageViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 28/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMMessageViewController: PMViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationLogo(isGradient: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PMMessageViewController {
    
    func addTouchListener() {
        let touchG = UITapGestureRecognizer(target: self, action: #selector(self.touchView))
        self.view.addGestureRecognizer(touchG)
    }
    
    func touchView() {
        self.dismiss(animated: true, completion: nil)
    }
}
