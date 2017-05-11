//
//  PMSuministroView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 10/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMSuministroView: UIView {
    
    @IBOutlet weak var frameBanner: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var imgBigBanner: UIImageView!
    
    func initUI() {
        loadBanners()
        borders()
    }
    
    func borders() {
        frameBanner.addBottomBorder()
    }
    
    func loadBanners() {
        if let item = Session.sharedInstance.current.item {
            let urlLogo1 = URL(string: item.empresa.logo)!
            let urlLogo2 = URL(string: item.logo_2)!
            imgBigBanner.af_setImage(withURL: urlLogo1,
                                     placeholderImage: nil,
                                     filter: nil,
                                     imageTransition: .crossDissolve(0.2))
            imgBanner.af_setImage(withURL: urlLogo2,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }
    
    class func instanceFromNib() -> PMSuministroView {
        return UINib(nibName: "SuministroView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMSuministroView
    }
}
