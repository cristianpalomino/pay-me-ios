//
//  NivelTresViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelTresViewController: PMViewController {
    
    var terceroView: PMTerceroView?
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.categoria?.name else {
            return "NONE"
        }
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        terceroView = PMTerceroView.instanceFromNib()
        terceroView?.initUI()
        terceroView?.touchDelegate = self
        if let lv = terceroView {
            add(mainView: lv)
        }
    }
}

extension PMNivelTresViewController: Touchable {
    
    func touch(params: Any?) {
        toSegue(identifier: "toSuministro")
    }
}
