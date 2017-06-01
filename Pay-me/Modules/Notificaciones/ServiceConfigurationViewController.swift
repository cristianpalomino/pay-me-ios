//
//  ServiceConfigurationViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class ServiceConfigurationViewController: PMViewController {
    
    
    @IBOutlet weak var txtIdentificador: PMTextField!
    @IBOutlet weak var txtNombreEmpresa: PMTextField!
    @IBOutlet weak var txtTitular: PMTextField!
    @IBOutlet weak var txtAlias: PMTextField!
    @IBOutlet weak var viewDiasPagoAutomatico: UIView!
    @IBOutlet weak var diasPagoAutomatico: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ServiceConfigurationViewController{
    
    override func initComponents() {
        addStyle()
        
    }
    
    
    func addStyle(){
        self.viewDiasPagoAutomatico.layer.masksToBounds = true
        self.viewDiasPagoAutomatico.layer.cornerRadius = self.viewDiasPagoAutomatico.frame.height * 0.5
    }
    
}
