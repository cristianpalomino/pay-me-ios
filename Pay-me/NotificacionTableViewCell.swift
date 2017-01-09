//
//  NotificacionTableViewCell.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import SWTableViewCell

class NotificacionTableViewCell: SWTableViewCell {

    @IBOutlet weak var myContentViewBottomConstraint: NSLayoutConstraint!
    struct State {
        static let kPendiente   = "pendiente"
        static let kCargo       = "cargo"
        static let kVerficacion = "verficacion"
    };
    
    static let identifier = "notificacionCell"
    
    @IBAction func removeNotification(_ sender: Any) {
        
    }
    
    
    @IBAction func btnCustomizeAction(_ sender: Any) {
    }
    
    @IBOutlet weak var icon     : UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var message  : UILabel!
    @IBOutlet weak var code     : UILabel!
    @IBOutlet weak var estado   : UILabel!
    @IBOutlet weak var monto    : UILabel!
    @IBOutlet weak var myContentView: UIView!
    
    
    internal var item: Notificacion! {
        didSet {
            let image = UIImage(named: item.image)
            self.icon.image = image!.imageWithInsets(insetDimen: 12)
            self.name.text = item.name
            self.message.text = item.message
            self.code.text = item.code
            self.monto.text = item.monto
            
            self.defineState(state: item.etiqueta)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addStyles()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

        
}

extension NotificacionTableViewCell {
    
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

extension NotificacionTableViewCell {
    
    func addStyles() {
        self.icon.layer.cornerRadius = self.icon.frame.height * 0.5
        self.icon.layer.borderWidth = 1
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        
        self.estado.layer.masksToBounds = true
        self.estado.layer.cornerRadius = self.estado.frame.height * 0.5
    }
}

