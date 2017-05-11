//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import AlamofireImage

class PMSuministroViewController: PMViewController {
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    var labels: [String] {
        guard let strings  = Session.sharedInstance.current.item?.label else {
            return ["NONE"]
        }
        return strings.components(separatedBy: ",")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        let viewFromNib = PMSuministroView.instanceFromNib()
        viewFromNib.initUI()
        self.view.addSubview(viewFromNib)
    }
}


