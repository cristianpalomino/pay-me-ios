//
//  PMDetalleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMDetalleView: UIView {

    var touchDelegate: Touchable?
    
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var frameBanner: UIView!
    
    weak var nameField: PMTextField!
    weak var codeField: PMTextField!
    
    func initUI() {
        prepare()
        define()
    }
    
    func define() {
        let services = Session.sharedInstance.current.addService.services
        if services.count > 1 {
            mainButton.setTitle("    Recordar servicio", for: .normal)
        } else {
            mainButton.setTitle("    Agregar servicio", for: .normal)
        }
    }
    
    func prepare() {
        mainButton.setGradientBackground()
        loadBanners()
        borders()
        addStaticFields()
    }
    
    func borders() {
        frameBanner.addBottomBorder()
    }
    
    func addStaticFields() {
        codeField = PMTextField.instanceFromNib()
        codeField.initUI()
        codeField.leftView.isHidden = false
        codeField.isUserInteractionEnabled = false
        codeField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(codeField)

        codeField.topAnchor.constraint(equalTo: frameBanner.bottomAnchor, constant: 80).isActive = true
        codeField.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
        codeField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        nameField = PMTextField.instanceFromNib()
        nameField.initUI()
        nameField.leftView.isHidden = false
        nameField.isUserInteractionEnabled = false
        nameField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameField)
        
        nameField.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 25).isActive = true
        nameField.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
        nameField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        if let identifier = Session.sharedInstance.current.addService.identifier {
            codeField.textField.text = identifier
        }
        
        guard let name = Session.sharedInstance.current.addService.userName else {
            nameField.isHidden = true
            return
        }
        
        nameField.textField.text = name
    }
    
    func loadBanners() {
        if let item = Session.sharedInstance.current.item {
            let url = URL(string: item.logo_2)!
            imgBanner.af_setImage(withURL: url,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }
    
    @IBAction func tapMain() {
        touchDelegate?.touch(params: nil)
    }
    
    class func instanceFromNib() -> PMDetalleView {
        return UINib(nibName: "DetalleView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMDetalleView
    }
}
