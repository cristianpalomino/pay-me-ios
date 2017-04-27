//
//  EntidadTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import AlamofireImage

class EntidadTableViewCell: UITableViewCell {
    static let identifier = "EntidadCell"
    
    @IBOutlet weak var addRigthMargin: NSLayoutConstraint!
    @IBOutlet weak var add: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topViewImageView: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    internal var servicio :Item! {
        didSet {
            self.name.text = servicio.empresa.name
            self.updateImage(url: servicio.logo)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topViewImageView.addCircleBorder()
        customSelection()
    }
}

extension EntidadTableViewCell {
    
    internal func updateImage(url :String) {
        guard let url = URL(string: url) else {
            return
        }
        let filter = AspectScaledToFillSizeCircleFilter(size: self.logo.frame.size)
        self.logo.af_setImage(withURL: url,
                              placeholderImage: nil,
                              filter: filter,
                              imageTransition: .crossDissolve(0.2))
    }
}

extension EntidadTableViewCell {
 
}
