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

    @IBOutlet weak var add: UIView!
    @IBOutlet weak var icon: UIImageView!
    
    internal var title: String! {
        didSet {
            if title == "0" || title == "2" {
                defaultStyle()
            }
            else {
                primaryStyle()
            }
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

extension ServiceTableViewCell {
    
    func primaryStyle() {
        let side = self.add.frame.width
        self.add.backgroundColor = UIColor.lightGray
    }
    
    func defaultStyle() {
        let side = self.add.frame.width
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: side * 0.2, y: side * 0.5))
        path.addLine(to: CGPoint(x: side * 0.8, y: side * 0.5))
        path.move(to: CGPoint(x: side * 0.5, y: side * 0.2))
        path.addLine(to: CGPoint(x: side * 0.5, y: side * 0.8))
        path.close()
        
        let shape = CAShapeLayer()
        shape.lineWidth = 1
        shape.strokeColor = UIColor.lightGray.cgColor
        shape.path = path.cgPath
        
        self.add.layer.addSublayer(shape)
    }

    func addStyles() {
        self.icon.layer.cornerRadius = self.icon.frame.height * 0.5
        self.icon.layer.borderWidth = 1
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        self.add.layer.cornerRadius = self.add.frame.height * 0.5
        self.add.layer.borderWidth = 1
        self.add.layer.borderColor = UIColor.lightGray.cgColor
    }
}
