//
//  PMCenterView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMCenterView: UIView {
    
    var shouldSetupFrame = true
    
    var imageBackground: UIImageView!
    var imageCenter: UIImageView!
    
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
        imageBackground = UIImageView(frame: .zero)
        addSubview(imageBackground)
        
        imageCenter = UIImageView()
        addSubview(imageCenter)
    }
    
    func update() {
        if shouldSetupFrame {
            centerImageBackground()
            centerImage()
            addCircleBorder()
            shouldSetupFrame = false
        }
    }
    
    func centerImage() {
        guard let sg = Session.sharedInstance.current.servicioGeneral else {
            prepareImageCenter(named: "isotipo-pay-me")
            return
        }
        
        prepareImageCenter(named: sg.logo)
    }
    
    func prepareImageCenter(named: String) {
        imageCenter.image = UIImage(named: named)!.withRenderingMode(.alwaysTemplate)
        imageCenter.tintColor = UIColor.pmSlateGrey
        
        imageCenter.contentMode = .scaleAspectFit
        imageCenter.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageCenter)
        
        imageCenter.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor).isActive = true
        imageCenter.centerYAnchor.constraint(equalTo: imageBackground.centerYAnchor).isActive = true
    }
    
    func centerImageBackground() {
        imageBackground.frame = frameImage
        imageBackground.image = UIImage(named: "center-icon-dos")
    }
    
    override func addCircleBorder() {
        layer.addSublayer(circleLayer(multiplier: 1.15, color: UIColor.pmWhite50))
        layer.addSublayer(circleLayer(multiplier: 1.4, color: UIColor.pmWhite20))
    }
    
    func circleLayer(multiplier: CGFloat, color: UIColor) -> CAShapeLayer {
        let clayer = CAShapeLayer()
        clayer.frame = CGRect(x: imageBackground.frame.origin.x,
                              y: imageBackground.frame.origin.y,
                              width: imageBackground.frame.width * multiplier,
                              height: imageBackground.frame.width * multiplier)
        clayer.position = imageBackground.center
        clayer.borderColor = color.cgColor
        clayer.borderWidth = 1
        clayer.cornerRadius = (imageBackground.frame.width * multiplier) * 0.5
        return clayer
    }
    
    var frameImage: CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
