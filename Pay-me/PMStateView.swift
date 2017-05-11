//
//  PMStateView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMStateView: UIView {

    var shouldSetupFrame = true
    var state: ServiceStateType = .pendiente_verificacion
    
    @IBOutlet weak var stateWidth: NSLayoutConstraint!
    
    var labelState: UILabel!
    var imageState: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    func prepare() {
    
        imageState = UIImageView(frame: .zero)
        imageState.backgroundColor = UIColor.clear
        addSubview(imageState)
    
        labelState = UILabel(frame: .zero)
        labelState.textColor = UIColor.white
        labelState.font = UIFont.SFSemibold(size: 8)
        addSubview(labelState)
        
        layer.cornerRadius = frame.height * 0.5
    }
    
    var frameImage: CGRect {
        return CGRect(x: 1, y: 0, width: 10, height: 10)
    }
    
    func update() {
        if shouldSetupFrame {
            switch state {
            case .pendiente_verificacion:
                labelState.text = "Pendiente de verificación".uppercased()
                backgroundColor = UIColor.appGrayColor()
                imageState.image = UIImage(named: "icono-triangulo")
                break
            case .pendiente_pago:
                labelState.text = "Pendiente de pago".uppercased()
                backgroundColor = UIColor.appRedColor()
                imageState.image = UIImage(named: "icono-triangulo")
                break
            case .pagado:
                labelState.text = "Pagado".uppercased()
                backgroundColor = UIColor.appRedColor()
                imageState.image = UIImage(named: "icono-triangulo")
                break
            case .cargos_recurrentes:
                labelState.text = "Cargo Automático".uppercased()
                backgroundColor = UIColor.appRedColor()
                imageState.image = UIImage(named: "cargo-automatico")
                break
            }
            
            imageState.frame = frameImage
            imageState.layer.cornerRadius = 5
            imageState.center.y = 6
            
            labelState.sizeToFit()
            labelState.frame = labelState.frame
            labelState.frame.origin = CGPoint(x: 16, y: 0)
            labelState.center.y = 6
            
            let totalWidthFrame = labelState.frame.width + labelState.frame.origin.x + 8
            stateWidth.constant = totalWidthFrame
            
            shouldSetupFrame = false
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
