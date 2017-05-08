//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelDosViewController: PMViewController {
    
    @IBOutlet weak var pmSpinnerView: PMSpinnerView!
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.servicioGeneral?.name else {
            return "NONE"
        }
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.whiteTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        if let servicioGeneral = Session.sharedInstance.current.servicioGeneral {
            pmSpinnerView.centerView.centerType = .white
            pmSpinnerView.items = servicioGeneral.items
            pmSpinnerView.spinnerType = SpinnerType(rawValue: servicioGeneral.items.count) ?? .point
        }
    }
}
