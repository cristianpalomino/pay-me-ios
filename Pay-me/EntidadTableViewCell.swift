//
//  EntidadTableViewCell.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Alamofire

class EntidadTableViewCell: UITableViewCell {
    static let identifier = "EntidadCell"
    
    @IBOutlet weak var addRigthMargin   :NSLayoutConstraint!
    
    @IBOutlet weak var add              :UIImageView!
    @IBOutlet weak var btnVerServicio   :UIButton!
    
    @IBOutlet weak var name             :UILabel!
    @IBOutlet weak var logo             :UIImageView!
    
    internal var servicio :Servicio! {
        didSet {
            self.name.text = servicio.name
            self.defineStyle()
            self.loadLogo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStyles()
    }
    
    @IBAction func tapVerServicio() {
        
    }
}

extension EntidadTableViewCell {
    
    func loadLogo() {
        Alamofire.request(servicio.logo).responseData {
            response in
            if let data = response.result.value {
                let image = UIImage(data: data)
                self.logo.layer.cornerRadius = self.logo.height * 0.5
                self.logo.clipsToBounds = true
                self.logo.image = image
            }
        }
    }
    
    func defineStyle() {
        
    }
}

extension EntidadTableViewCell {
    
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
    
    func primaryStyle() {
        let side = self.add.frame.width
        let frame = CGRect(x: 0, y: 0, width: side * 0.6, height: side * 0.6)
        let countlabel = UILabel(frame: frame)
        countlabel.center = CGPoint(x: (self.frame.width - (addRigthMargin.constant + side * 0.9)), y: self.frame.height * 0.5)
        countlabel.backgroundColor = UIColor.appBlueColor()
        countlabel.layer.cornerRadius = frame.height * 0.5

        countlabel.textColor = UIColor.white
        countlabel.textAlignment = .center
        countlabel.text = "1"
        countlabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        countlabel.clipsToBounds = true
        
        self.add.backgroundColor = UIColor.lightGray
        self.addSubview(countlabel)
    }
    
    func addStyles() {
        self.logo.layer.cornerRadius = self.logo.frame.height * 0.5
        self.logo.layer.borderWidth = 1
        self.logo.layer.borderColor = UIColor.lightGray.cgColor
        self.logo.image = self.logo.image!.imageWithInsets(insetDimen: 12)
        
        self.add.layer.cornerRadius = self.add.frame.height * 0.5
        self.add.layer.borderWidth = 1
        self.add.layer.borderColor = UIColor.lightGray.cgColor
    }
}
