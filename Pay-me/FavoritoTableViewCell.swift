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
    
    var favoriteCellDelegate :FavoriteCellDelegate?
    static let identifier       = "favoritoCell"
    
    @IBOutlet weak var icon     : UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var entidad  : UILabel!
    @IBOutlet weak var code     : UILabel!
    @IBOutlet weak var estado   : UILabel!
    @IBOutlet weak var monto    : UILabel!
    
    func updateCellWith(service :Service) {
        self.updateImage(url: "")
        self.defineState(state: service.state)
        
        self.name.text      = service.alias
        self.entidad.text   = "NONE"
        self.code.text      = service.codeService
        self.monto.text     = service.amount.currency()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStyles()
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
    
    func defineState(state : ServiceStateType) {
        switch state {
        case .PENDIENTE_VERIFICACION:
            self.estado.text = "   Pendiente de verificación   ".uppercased()
            self.estado.backgroundColor = UIColor.appGrayColor()
            break
        case .PENDIENTE_PAGO:
            self.estado.text = "   Pendiente de pago   ".uppercased()
            self.estado.backgroundColor = UIColor.appRedColor()
            break
        case .PAGADO:
            self.estado.text = "   Pagado   ".uppercased()
            self.estado.backgroundColor = UIColor.appRedColor()
            break
        case .ELIMINADO:
            self.estado.text = "   Eliminado   ".uppercased()
            self.estado.backgroundColor = UIColor.appRedColor()
            break
        }
    }
    
    func updateImage(url :String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let placeholder = UIImage(named: "placeholder-default")
        
        let filter = AspectScaledToFillSizeCircleFilter(size: self.icon.frame.size)
        self.icon.af_setImage(withURL: url, placeholderImage: placeholder, filter: filter, imageTransition: .crossDissolve(0.2))
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



