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
    
    func update(service :Service) {
        let item = Session.sharedInstance.staticData.getItem(idCompanySPS: service.idCompanySPS, idServiceSPS: service.idServiceSPS)
        
        self.updateImage(url: item?.logo_2 ?? "NONE")
    
        if service.inSPR == "1" {
            self.defineState(state: .CARGOS_RECURRENTES)
        } else {
            self.defineState(state: service.state)
        }
        
        self.name.text      = service.alias
        self.entidad.text   = item?.empresa.name ?? "NONE"
        self.code.text      = service.codeService
        
        if let amount = service.amount {
            self.monto.isHidden = false
            self.monto.text     = amount.currency()
        } else {
            self.monto.isHidden = true
        }
    }
    
    internal func defineState(state : ServiceStateType) {
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
        case .CARGOS_RECURRENTES:
            self.estado.text = "   Cargo Automático   ".uppercased()
            self.estado.backgroundColor = UIColor.appRedColor()
            break
        }
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

extension FavoritoTableViewCell {
    
    internal func addStyles() {
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



