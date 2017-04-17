//
//  NivelUnoViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelUnoViewController: PMViewController {
    @IBOutlet weak var titleView:   PMTitleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleView.titleLabel.text = TitleTriger.primero.titleLabelText
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        blueTheme()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NivelUnoViewController {
    
    @IBAction func tapBasicos() {
        Session.sharedInstance.current.servicioGeneral = Session.sharedInstance.staticData.serviciosGenerales[0]
        performSegue(withIdentifier: "toCategorias", sender: nil)
    }
    
    @IBAction func tapEducacion() {
        Session.sharedInstance.current.servicioGeneral = Session.sharedInstance.staticData.serviciosGenerales[1]
        performSegue(withIdentifier: "toCategorias", sender: nil)
    }
    
    @IBAction func tapSeguros() {
//        Session.sharedInstance.current.servicioGeneral = Session.sharedInstance.staticData.serviciosGenerales[2]
//        performSegue(withIdentifier: "toCategorias", sender: nil)
    }
    
    @IBAction func tapTributos() {
//        Session.sharedInstance.current.servicioGeneral = Session.sharedInstance.staticData.serviciosGenerales[3]
//        performSegue(withIdentifier: "toCategorias", sender: nil)
    }
}
