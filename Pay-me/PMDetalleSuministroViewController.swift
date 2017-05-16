//
//  DetalleSuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import AlamofireImage
import SwiftyJSON
import UIKit

class PMDetalleSuministroViewController: PMViewController {
    
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Session.sharedInstance.clearAddService()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        let detalleView = PMDetalleView.instanceFromNib()
        detalleView.initUI()
        detalleView.touchDelegate = self
        add(mainView: detalleView)
    }
}

extension PMDetalleSuministroViewController: Touchable {
    
    func touch(params: Any?) {
        toSegue(identifier: "toListDetailSuministro")
    }
}
