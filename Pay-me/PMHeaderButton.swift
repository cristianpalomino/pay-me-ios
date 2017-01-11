//
//  PMHeaderButton.swift
//  TabsHeader
//
//  Created by Cristian Palomino Rivera on 16/01/17.
//  Copyright © 2017 Aerolab. All rights reserved.
//

import UIKit

class PMHeaderButton: UIButton {
    
    init(frame: CGRect,title: String, isFocus: Bool) {
        super.init(frame: frame)
        
        self.setTitle(title, for: .normal)
        if isFocus {
            setFocusStyle()
        } else {
            setNormalStyle()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    func initStyles() {
        self.titleLabel?.textAlignment = .center
    }
    
    func setFocusStyle() {
        self.titleLabel?.textColor = UIColor.white
        self.backgroundColor = UIColor.appBlueColor()
        self.layer.cornerRadius = bounds.height * 0.5
    }
    
    func setNormalStyle() {
        self.titleLabel?.textColor = UIColor.appGrayColor()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = bounds.height * 0.5
    }
}
