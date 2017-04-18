//
//  PMTitleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 17/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
class PMTitleView: UIView {
    @IBOutlet private var mview:    UIView?

    @IBOutlet var backButton:   UIButton!
    @IBOutlet var titleLabel:   UILabel!
    @IBOutlet var searchButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle(for: PMItemCard.self).loadNibNamed("PMTitleView", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}


