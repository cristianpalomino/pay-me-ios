//
//  PMTitleButton.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 17/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

@IBDesignable
class PMTitleButton: UIButton {
    @IBOutlet private var mview :UIButton?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        self.backgroundColor = UIColor.red
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        self.backgroundColor = UIColor.red
    }
    
    override func draw(_ rect: CGRect) {
        mview!.layer.cornerRadius = 100
    }
    
    private func commonInit() {
        Bundle(for: PMTitleButton.self).loadNibNamed("PMTitleButton", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func cornerRadius() {
        
    }
}

extension PMTitleButton {

    
}
