//
//  FavoritoTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {
    static let identifier = "favoritoCell"

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var estado: UILabel!

    internal var title: String! {
        didSet {
            if title == "0" || title == "2" {
//                defaultStyle()
            }
            else {
//                primaryStyle()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStyles()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension FavoritoTableViewCell {
    
    func addStyles() {
        self.icon.layer.cornerRadius = self.icon.frame.height * 0.5
        self.icon.layer.borderWidth = 1
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        
        self.estado.layer.masksToBounds = true
        self.estado.layer.cornerRadius = self.estado.frame.height * 0.5
    }
}


