//
//  PMItemCard.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 1/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMItemCard: UIView {
    @IBOutlet private var mview :UIView?
    
    @IBOutlet var centerContraint   :NSLayoutConstraint!
    @IBOutlet var image             :UIImageView!
    @IBOutlet var nextimage         :UIImageView!
    @IBOutlet var title             :UILabel!
    @IBOutlet var number            :UILabel!
    
    var card :Card!
    
    public init(frame: CGRect, card :Card) {
        super.init(frame: frame)
        self.commonInit()
        self.card = card
        self.initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    private func commonInit() {
        Bundle(for: PMItemCard.self).loadNibNamed("PMItemCard", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}

extension PMItemCard {
    
    func initView() {
        self.image.image = UIImage(named: card.image)
        setTypeStyle()
    }
 
    func setTypeStyle() {
        switch self.card.type {
        case .VALID:
            defineValid()
            break
        case .INVALID:
            defineInvalid()
            break
        case .ADD:
            defineAdd()
            break
        case .DEFAULT:
            defineDefault()
            break
        }
    }
    
    func defineValid() {
        self.number.textColor = UIColor.appGrayColor()
    }
    
    func defineDefault() {
        self.number.textColor = UIColor.appGrayColor()
    }
    
    func defineInvalid() {
        self.number.textColor = UIColor.appRedColor()
    }
    
    func defineAdd() {
        self.number.isHidden = true
        self.nextimage.isHidden = true
        self.centerContraint.constant = 0
        self.title.text = "¿Desea adicionar una nueva tarjeta?"
    }
}
