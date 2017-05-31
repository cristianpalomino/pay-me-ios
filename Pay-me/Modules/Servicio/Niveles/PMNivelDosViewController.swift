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
        guard let title = Session.shared.current.servicioGeneral?.name else {
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
        if let servicioGeneral = Session.shared.current.servicioGeneral {
            
            let pmSpinnerView = PMSpinnerView(frame: container.bounds)
            pmSpinnerView.backgroundColor = UIColor.pmPaleGrey80
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
            if let sg = Session.shared.current.servicioGeneral {
                let categoria = sg.categorias[index]
                if !categoria.items.isEmpty {
                    Session.shared.current.categoria = categoria
                    toSegue(identifier: "toTercero")
                }
            }
        }
    }
}
