//
//  PMItemView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

// 69px
class PMItemView: UIView {
    var shouldSetupFrame = true

    var circleView: UIView!
    var labelItem: UILabel!
    var imageItem: UIImageView!
    
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
        labelItem = UILabel(frame: .zero)
        addSubview(labelItem)
        
        circleView = UIView(frame: .zero)
        addSubview(imageItem)
        
        imageItem = UIImageView(frame: .zero)
        circleView.addSubview(imageItem)
    }
    
    func update() {
        if shouldSetupFrame {
            
            
            
            addCircleBorder()
            
            shouldSetupFrame = false
        }
    }
    
    override func addCircleBorder() {
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.cornerRadius = frameImage.height * 0.5
    }
    
    var frameImage: CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
