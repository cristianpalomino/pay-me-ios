//
//  PMErrorView.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 15/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class PMErrorView: UIView {
    
    @IBOutlet weak var labelMessage: UILabel!
    
    func initUI() {
        
    }
    
    class func instanceFromNib() -> PMErrorView {
        return UINib(nibName: "ErrorView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMErrorView
    }
}

class PMExtraView: UIView {
    
    var touchDelegate: Touchable?
    
    @IBAction func tapNoEsMiServicio() {
        touchDelegate?.touch(params: nil)
    }
    
    class func instanceFromNib() -> PMExtraView {
        return UINib(nibName: "ErrorView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil)[1] as! PMExtraView
    }
}
