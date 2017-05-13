//
//  PMInfoView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMInfoView: UIView {

    @IBOutlet weak var labelInformation: UILabel!
    @IBOutlet weak var labelDireccion:   UILabel!
    @IBOutlet weak var labelTelefono:    UILabel!
    @IBOutlet weak var labelWeb:         UILabel!
    
    var empresa: Empresa? {
        didSet {
            labelDireccion.text = empresa?.direccion
            labelTelefono.text = empresa?.telefono
            labelWeb.text = empresa?.correo
        }
    }
    
    class func instanceFromNib() -> PMInfoView {
        return UINib(nibName: "SuministroView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil)[1] as! PMInfoView
    }
}

