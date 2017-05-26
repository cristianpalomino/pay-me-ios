//
//  FavoritoTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import AlamofireImage
import UIKit

class FavoritoTableViewCell: UITableViewCell {
    static let identifier       = "favoritoCell"
    
    var favoriteCellDelegate :FavoriteCellDelegate?
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var buttonIcon: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var entidad: UILabel!
    @IBOutlet weak var code : UILabel!
    @IBOutlet weak var estado: PMStateView!
    @IBOutlet weak var monto : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customSelection()
        buttonIcon.addCircleBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension FavoritoTableViewCell {
    
    @IBAction func tapSeetings() {
        favoriteCellDelegate?.tapFavorite()
    }
}

extension FavoritoTableViewCell {
    
    func update(favorito :Favorito) {
        guard let item = Session.shared.staticData.getItem(idCompanySPS: favorito.idCompanySPS)  else {
            return
        }
    
        // INSPR
        if favorito.inSPR != "1" {
            estado.state = .cargos_recurrentes
        } else {
            estado.state = favorito.state
        }
        
        // ALIAS
        if let alias = favorito.alias {
            name.text = alias
        } else {
            name.text = item.entidad
        }
        
        // AMOUNT
        if let amount = favorito.amount {
            monto.isHidden = false
            monto.text = amount.currency()
        } else {
            monto.isHidden = true
        }
        
        entidad.text = item.entidad
        code.text = favorito.serviceIdentifier
        updateImage(url: item.logo)
    }
    
    internal func updateImage(url :String) {
        guard let url = URL(string: url) else {
            return
        }
        //let placeholder = UIImage(named: "placeholder-default")
        let filter = AspectScaledToFillSizeCircleFilter(size: self.icon.frame.size)
        self.icon.af_setImage(withURL: url, placeholderImage: nil, filter: filter, imageTransition: .crossDissolve(0.2))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.icon.af_cancelImageRequest()
        self.icon.layer.removeAllAnimations()
        self.icon.image = nil
    }
}

protocol FavoriteCellDelegate {
    
    func tapFavorite()
}

extension Item {
    
    var entidad: String {
        if empresa.name.characters.count > 30 {
            return empresa.shortName
        } else {
            return empresa.name
        }
    }
}


