//
//  ServiceTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    static let identifier = "ServicioCell"
    
    @IBOutlet weak var imageViewService:    UIImageView!
    @IBOutlet weak var imageViewState:      UIImageView!
    @IBOutlet weak var labelNameService:    UILabel!
    @IBOutlet weak var labelSolicitar:      UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStyles()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.imageViewState.image = selected ? UIImage(named: "icono-agregado") : UIImage(named: "icono-agregar")
        self.imageViewService.image = selected ? UIImage(named: "icono-servicio-degradado") : UIImage(named: "icono-servicio")
    }
}

extension ServiceTableViewCell {
    
    func set(service: Service) {
        self.labelNameService.text = service.nameService
        self.imageViewState.image = isSelected ? UIImage(named: "icono-agregado") : UIImage(named: "icono-agregar")
    }
}

extension ServiceTableViewCell {

    func addStyles() {
        self.imageViewService.layer.cornerRadius = self.imageViewService.frame.height * 0.5
        self.imageViewService.layer.borderWidth = 1
        self.imageViewService.layer.borderColor = UIColor.lightGray.cgColor
        self.imageViewService.image = self.imageViewService.image!.imageWithInsets(insetDimen: 20)
        self.imageViewService.image = imageViewService.image!.withRenderingMode(.alwaysTemplate)
        self.imageViewService.tintColor = UIColor.appBlueColor()
    }
}
