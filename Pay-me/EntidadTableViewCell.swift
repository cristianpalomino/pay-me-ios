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
    
    @IBOutlet weak var nameBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topViewImageView: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    internal var servicio :Item! {
        didSet {
            setName()
            updateImage(url: servicio.logo)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topViewImageView.addCircleBorder()
        customSelection()
    }
}

extension EntidadTableViewCell {
    
    func setName() {
        if servicio.empresa.name.characters.count > 30 {
            nameBottomConstraint.constant = 4
        }
        self.name.text = servicio.empresa.name
    }
    
    internal func updateImage(url :String) {
        guard let url = URL(string: url) else {
            return
        }
        let filter = AspectScaledToFillSizeCircleFilter(size: self.logo.frame.size)
        logo.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: filter,
                         imageTransition: .crossDissolve(0.2))
    }
}

extension EntidadTableViewCell {
 
}
