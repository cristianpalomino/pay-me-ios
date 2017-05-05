//
//  PMSpinnerView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMSpinnerView: UIView {
    var shouldSetupFrame = true
    
    var centerView: PMCenterView!
    
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
        centerView = PMCenterView(frame: .zero)
        centerView.backgroundColor = UIColor.blue
        addSubview(centerView)
    }
    
    func update() {
        if shouldSetupFrame {
            centerView.frame = frameCenterView
            centerView.center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
            
            
            shouldSetupFrame = false
        }
    }
    
    override func addCircleBorder() {
        layer.cornerRadius = bounds.height * 0.5
    }
    
    var frameCenterView: CGRect {
        let side = bounds.width * (94 / bounds.width)
        return CGRect(x: 0, y: 0, width: side, height: side)
    }
}

struct Square {
    
    var axisA: CGFloat
}
