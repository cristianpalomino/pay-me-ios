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
        imageBackground.backgroundColor = UIColor.gray
        addSubview(imageBackground)
        
        imageCenter = UIImageView(frame: .zero)
        addSubview(imageCenter)
    }
    
    func update() {
        if shouldSetupFrame {
            
            
            
            addCircleBorder()
            
            shouldSetupFrame = false
        }
    }
    
    override func addCircleBorder() {
        layer.cornerRadius = bounds.height * 0.5
    }
    
    var frameImage: CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
