//
//  PMCenterView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMCenterView: UIView {
    
    var centerType: CenterType = .blue
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
            //addCircleBorder()
            shouldSetupFrame = false
        }
    }
    
    func centerImage() {
        switch centerType {
        case .white:
            if let sg = Session.sharedInstance.current.servicioGeneral {
                imageCenter.image = UIImage(named: sg.logo)!.withRenderingMode(.alwaysTemplate)
                imageCenter.tintColor = UIColor(hexColor: "#656774")
            }
            break
        case .blue:
            break
        }
        
        imageCenter.contentMode = .scaleAspectFit
        imageCenter.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageCenter)
        
        imageCenter.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor).isActive = true
        imageCenter.centerYAnchor.constraint(equalTo: imageBackground.centerYAnchor).isActive = true
    }
    
    func centerImageBackground() {
        switch centerType {
        case .white:
            imageBackground.frame = frameImage
            imageBackground.image = UIImage(named: "center-icon-dos")
            break
        case .blue:
            imageBackground.frame = frameImage
            imageBackground.image = UIImage(named: "center-icon")
            break
        }
    }
    
    override func addCircleBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = bounds.height * 0.5
    }
    
    var frameImage: CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}

enum CenterType {
    
    case blue
    case white
}
