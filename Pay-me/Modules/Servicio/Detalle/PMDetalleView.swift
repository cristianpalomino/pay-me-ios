//
//  PMDetalleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMDetalleView: UIView {
    
    var viewController: PMDetalleSuministroViewController!
    
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var frameBanner: UIView!
    @IBOutlet weak var labelService: UILabel!
    
    weak var nameField: PMTextField?
    weak var codeField: PMTextField!
    
    func initUI(viewController: PMDetalleSuministroViewController!) {
        self.viewController = viewController
        prepare()
        define()
    }
    
    func define() {
        guard let response = viewController.responseConsult else { return }
        let services = response.services
        
        if services.isEmpty {
            mainButton.setTitle("    Recordar servicio", for: .normal)
        } else if services.count == 1 {
            labelService.text = services.first!.nameService.capitalized
            mainButton.setTitle("    Recordar servicio", for: .normal)
        } else {
            mainButton.setTitle("    Agregar servicio", for: .normal)
        }
    }
    
    func prepare() {
        mainButton.setGradientBackground()
        loadBanners()
        borders()
        fields()
        createExtraView()
    }
    
    func borders() {
        frameBanner.addBottomBorder()
    }
    
    func fields() {
        createCodeField()
        
        if let identifier = viewController.identifier {
            codeField.textField.text = identifier
        }
        
        guard
            let response = viewController.responseConsult
        else {
            createErrorView()
            return
        }
        
        createNameField()
        nameField?.textField.text = response.name
    }
    
    func createCodeField() {
        codeField = PMTextField.instanceFromNib()
        codeField.initUI()
        codeField.leftView.isHidden = false
        codeField.isUserInteractionEnabled = false
        codeField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(codeField)
        
        codeField.topAnchor.constraint(equalTo: frameBanner.bottomAnchor, constant: 80).isActive = true
        codeField.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
        codeField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func createNameField() {
        nameField = PMTextField.instanceFromNib()
        nameField!.initUI()
        nameField!.leftView.isHidden = false
        nameField!.isUserInteractionEnabled = false
        nameField!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameField!)
        
        nameField!.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 25).isActive = true
        nameField!.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
        nameField!.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func createErrorView() {
        let errorView = PMErrorView.instanceFromNib()
        errorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(errorView)

        errorView.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 30).isActive = true
        errorView.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 30).isActive = true
        errorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    }
    
    func createExtraView() {
        let extraView = PMExtraView.instanceFromNib()
        extraView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(extraView)
        
        if nameField != nil {
            extraView.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 90).isActive = true
        } else {
            extraView.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 129).isActive = true
        }
        extraView.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 30).isActive = true
        extraView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    }
    
    func loadBanners() {
        if let item = Session.shared.current.item {
            let url = URL(string: item.logo_2)!
            imgBanner.af_setImage(withURL: url,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }
    
    var selectedService: Service? {
        return viewController.responseConsult!.services.first!
    }
    
    @IBAction func tapMain() {
        guard let response = viewController.responseConsult else { return }
        let services = response.services
        
        if services.isEmpty {
            let information = ("!No hay servicios!", "To you how all this mistaken idea of denouncing pleasure and praising pain.")
            viewController.showMessage(information: information)
        } else if services.count == 1 {
            viewController.callAddService()
        } else {
            viewController.toSegue(identifier: "toListDetailSuministro")
        }
    }
    
    class func instanceFromNib() -> PMDetalleView {
        return UINib(nibName: "DetalleView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMDetalleView
    }
}
