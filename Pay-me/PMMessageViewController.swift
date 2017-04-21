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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMMessageViewController {
    
    func addTouchListener() {
        let touchG = UITapGestureRecognizer(target: self, action: #selector(self.touchView))
        self.view.addGestureRecognizer(touchG)
    }
}
