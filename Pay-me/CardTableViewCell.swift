//
//  CardTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 10/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    static let identifier = "CardCell"
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var estado   : UILabel!
    
    internal var item: Card! {
        didSet {
            self.cardImage.image = UIImage(named: item.image)
            
            if item.type == .INVALID {
                self.estado.text = "DENEGADO"
                self.estado.textColor = UIColor.appRedHistoricoColor()
            } else {
                self.estado.text = "EXITOSO"
                self.estado.textColor = UIColor.appGreenHistoricoColor()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
