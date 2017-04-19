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
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Helper Methods
    
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
    }
    
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setInformation(empresa :Empresa?) {
        self.labelDireccion.text = empresa?.direccion
        self.labelTelefono.text = empresa?.telefono
        self.labelWeb.text = empresa?.correo
    }
}

