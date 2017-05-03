//
//  PMViews.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class PMView : UIView {
    
    @IBOutlet public var mview :UIView?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        self.initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override func draw(_ rect: CGRect) {}
    
    public func commonInit() {
        
    }
    
    func initView() {
        
    }
}

class PMErrorView : PMView {
    
//    public var pmError :PaymeError? {
//        didSet {
//            self.labelMessage.text = pmError?.answerMessage
//        }
//    }
    
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var imageMessage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
    }
    
    public override func commonInit() {
        Bundle(for: PMErrorView.self).loadNibNamed("PMErrorView", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}
