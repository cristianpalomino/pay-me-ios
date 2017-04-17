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

protocol TitleLabel {
    
    var titleLabelText: String { get }
}

enum TitleTriger: TitleLabel {
    
    case favoritos
    case primero
    case segundo
    case tercero
    case cuarto
    
    var titleLabelText: String {
        switch self {
        case .favoritos:
            return "Mis Favoritos"
        case .primero:
            return "Servicios"
        case .segundo:
            guard let title = Session.sharedInstance.current.servicioGeneral?.name else {
                return "NONE"
            }
            return title
        case .tercero:
            guard let title = Session.sharedInstance.current.categoria?.name else {
                return "NONE"
            }
            return title
        case .cuarto:
            guard let title = Session.sharedInstance.current.item?.empresa.name else {
                return "NONE"
            }
            return title
        }
    }
}
