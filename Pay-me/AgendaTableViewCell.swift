//
//  AgendaTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 11/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {
    static let identifier = "AgendaCell"
    
    @IBOutlet weak var name         : UILabel!
    @IBOutlet weak var entidad      : UILabel!
    @IBOutlet weak var identifier   : UILabel!
    @IBOutlet weak var total        : UILabel!
    @IBOutlet weak var fecha        : UILabel!
    @IBOutlet weak var estado       : UILabel!
    
    @IBOutlet weak var leftView     : UIView!
    
    internal var item: Pay! {
        didSet {
            self.name.text = item.name
            self.entidad.text = item.entidad
            self.identifier.text = item.identifier
            self.total.text = item.total
            self.fecha.text = item.fecha
            
            self.estado.backgroundColor = item.getColor()
            self.leftView.backgroundColor = item.getColor()
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
