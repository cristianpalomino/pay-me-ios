//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelDosViewController: PMViewController {
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.servicioGeneral?.name else {
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
        if let servicioGeneral = Session.sharedInstance.current.servicioGeneral {
            
            let pmSpinnerView = PMSpinnerView(frame: container.bounds)
            pmSpinnerView.centerView.centerType = .white
            pmSpinnerView.backgroundColor = UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
            pmSpinnerView.items = servicioGeneral.items
            pmSpinnerView.delegate = self
            pmSpinnerView.spinnerType = SpinnerType(rawValue: servicioGeneral.items.count) ?? .point
            add(mainView: pmSpinnerView)
        }
    }
}

extension PMNivelDosViewController: Touchable {
    
    func touch(params: Any?) {
        
        if let view = params as? PMItemView {
            let index = view.tag
            if let sg = Session.sharedInstance.current.servicioGeneral {
                let categoria = sg.categorias[index]
                if !categoria.items.isEmpty {
                    Session.sharedInstance.current.categoria = categoria
                    toSegue(identifier: "toTercero")
                }
            }
        }
    }
}
