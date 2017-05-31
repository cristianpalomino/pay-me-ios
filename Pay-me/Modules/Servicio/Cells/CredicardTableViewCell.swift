//
//  CredicardTableViewCell.swift
//  payme
//
//  Created by Franco Paredes on 27/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class CredicardTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageview: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
