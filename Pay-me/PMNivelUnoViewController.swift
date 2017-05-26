//
//  NivelUnoViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelUnoViewController: PMViewController {
    
    var items: Items {
        return [("Basicos", UIImage(named: "basicos")!),
                ("Seguros", UIImage(named: "seguros")!),
                ("Educación", UIImage(named: "educacion")!),
                ("Tributos", UIImage(named: "tributos")!)]
    }
    
    override var headerTitle: String {
        return "Servicios"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        let pmSpinnerView = PMSpinnerView(frame: container.bounds)
        pmSpinnerView.backgroundColor = UIColor.pmPaleGrey80
        pmSpinnerView.delegate = self
        pmSpinnerView.items = items
        pmSpinnerView.spinnerType = .square
        add(mainView: pmSpinnerView)
    }
}

extension PMNivelUnoViewController: Touchable {
    
    func touch(params: Any?) {
        if let view = params as? PMItemView {
            let index = view.tag
            let sg = Session.shared.staticData.serviciosGenerales[index]
            if !sg.categorias.isEmpty {
                Session.shared.current.servicioGeneral = sg
                toSegue(identifier: "toSegundo")
            }
        }
    }
}
