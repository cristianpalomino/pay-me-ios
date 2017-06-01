//
//  PMTitleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 17/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMBarView: UIView {
    
    @IBOutlet var backButton:   UIButton!
    @IBOutlet var titleLabel:   UILabel!
    @IBOutlet var searchButton: UIButton!
    
    func title(_ string: String) {
        titleLabel.text = string
    }
    
    @IBAction func tapBack() {
        //self.pmViewController?.tapBack()
    }
    
    @IBAction func tapSearch() {
        //self.pmViewController?.tapSearch()
    }
    
    class func instanceFromNib() -> PMBarView {
        return UINib(nibName: "BarView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMBarView
    }
}



