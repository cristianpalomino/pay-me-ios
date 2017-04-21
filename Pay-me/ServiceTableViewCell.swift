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

    var state: Bool = false
    
    @IBOutlet weak var imageViewService:    UIImageView!
    @IBOutlet weak var labelNameService:    UILabel!
    @IBOutlet weak var labelSolicitar:      UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStyles()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ServiceTableViewCell {
    
    func set(debt: Debt) {
        self.labelNameService.text = debt.nameService
    }
}

extension ServiceTableViewCell {
    
    func primaryStyle() {
//        let side = self.add.frame.width
//        self.add.backgroundColor = UIColor.lightGray
    }

    func addStyles() {
        self.imageViewService.layer.cornerRadius = self.imageViewService.frame.height * 0.5
        self.imageViewService.layer.borderWidth = 1
        self.imageViewService.layer.borderColor = UIColor.lightGray.cgColor
        self.imageViewService.image = self.imageViewService.image!.imageWithInsets(insetDimen: 20)
        self.imageViewService.image = imageViewService.image!.withRenderingMode(.alwaysTemplate)
        self.imageViewService.tintColor = UIColor.appBlueColor()
    }
}
