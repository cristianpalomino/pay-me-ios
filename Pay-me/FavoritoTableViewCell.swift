//
//  FavoritoTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {
    struct State {
        static let kPendiente   = "pendiente"
        static let kCargo       = "cargo"
        static let kVerficacion = "verficacion"
    };
    
    var favoriteCellDelegate :FavoriteCellDelegate?
    static let identifier = "favoritoCell"

    @IBOutlet weak var icon     : UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var entidad  : UILabel!
    @IBOutlet weak var code     : UILabel!
    @IBOutlet weak var estado   : UILabel!
    @IBOutlet weak var monto    : UILabel!

    internal var item: Favorito! {
        didSet {
            let image = UIImage(named: item.image)
            self.icon.image = image!.imageWithInsets(insetDimen: 12)
            self.name.text = item.name
            self.entidad.text = item.entidad
            self.code.text = item.code
            self.monto.text = item.monto
            
            self.defineState(state: item.etiqueta)
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
    
    @IBAction func tapSeetings() {
        favoriteCellDelegate?.tapFavorite()
    }
}

extension FavoritoTableViewCell {
    
    func defineState(state :String) {
        self.estado.text = state
        if state == State.kPendiente {
            self.estado.text = "  PENDIENTE DE PAGO  "
            self.estado.backgroundColor = UIColor.appRedColor()
        }
        else if state == State.kCargo {
            self.estado.text = "  CARGO AUTOMATICO  "
            self.estado.backgroundColor = UIColor.appGrayColor()
        }
        else if state == State.kVerficacion {
            self.estado.text = "  PENDIENTE DE VERIFICACIÓN  "
            self.estado.backgroundColor = UIColor.appGrayColor()
        }
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

protocol FavoriteCellDelegate {
    func tapFavorite()
}



