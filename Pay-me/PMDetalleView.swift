//
//  PMDetalleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMDetalleView: UIView {

    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var frameBanner: UIView!
    
    weak var nameField: PMTextField!
    weak var codeField: PMTextField!
    
    func initUI() {
        prepare()
        loadBanners()
        borders()
    }
    
    func prepare() {
        mainButton.setGradientBackground()
    }
    
    func borders() {
        frameBanner.addBottomBorder()
    }
    
    func loadBanners() {
        if let item = Session.sharedInstance.current.item {
            let url = URL(string: item.logo_2)!
            imgBanner.af_setImage(withURL: url,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }
}
