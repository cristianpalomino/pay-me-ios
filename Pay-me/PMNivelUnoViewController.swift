//
//  NivelUnoViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelUnoViewController: PMViewController {

    @IBOutlet weak var pmSpinnerView: PMSpinnerView!
    
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.blueTheme()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        pmSpinnerView.delegate = self
        pmSpinnerView.items = items
        pmSpinnerView.spinnerType = .square
    }
}

extension PMNivelUnoViewController: Touchable {
    
    func touch(params: Any) {
        if let view = params as? PMItemView {
            let index = view.tag
            let sg = Session.sharedInstance.staticData.serviciosGenerales[index]
            if !sg.categorias.isEmpty {
                Session.sharedInstance.current.servicioGeneral = sg
                toSegue(identifier: Constants.Storyboard.Segues.kToCategorias)
            }
        }
    }
}
