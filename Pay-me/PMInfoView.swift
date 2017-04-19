//
//  PMInfoView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMInfoView: UIView {

    @IBOutlet private var mview:    UIView?
    
    @IBOutlet var labelInformation: UILabel!
    @IBOutlet var labelDireccion:   UILabel!
    @IBOutlet var labelTelefono:    UILabel!
    @IBOutlet var labelWeb:         UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle(for: PMItemCard.self).loadNibNamed("PMInfoView", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func setInformation(empresa :Empresa?) {
        self.labelDireccion.text = empresa?.direccion
        self.labelTelefono.text = empresa?.telefono
        self.labelWeb.text = empresa?.correo
    }
}

