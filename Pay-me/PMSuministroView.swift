//
//  PMSuministroView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 10/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMSuministroView: UIView {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var frameInfo: UIView!
    @IBOutlet weak var frameBanner: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var imgBigBanner: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var btnVerMas: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    weak var field: PMTextField!
    
    func initUI() {
        keyBoardObservers()
        prepare()
        loadBanners()
        borders()
        addTextField()
    }
    
    func prepare() {
        mainButton.setGradientBackground()
        btnVerMas.layer.cornerRadius = 8
        btnVerMas.isHidden = true
    }
    
    func borders() {
        frameBanner.addBottomBorder()
    }
    
    var placeholder: String? {
        didSet {
            field.textField.placeholder = placeholder
        }
    }
    
    func keyBoardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.showsKeyBoard(notification:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.hideshowKeyBoard(notification:)),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
    }
    
    func addTextField() {
        field = PMTextField.instanceFromNib()
        field.initUI()
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        
        field.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 20).isActive = true
        field.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
        field.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func loadBanners() {
        if let item = Session.sharedInstance.current.item {
            let urlLogo1 = URL(string: item.empresa.logo)!
            let urlLogo2 = URL(string: item.logo_2)!
            imgBigBanner.af_setImage(withURL: urlLogo1,
                                     placeholderImage: nil,
                                     filter: nil,
                                     imageTransition: .crossDissolve(0.2))
            imgBanner.af_setImage(withURL: urlLogo2,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }
    
    func hideKeyBoard() {
        bottomConstraint.constant = 0
        topConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.btnVerMas.isHidden = true
            self.layoutIfNeeded()
        }
    }
    
    func showKeyBoard() {
        bottomConstraint.constant = 167
        topConstraint.constant = (-(imgBigBanner).frame.height)
        UIView.animate(withDuration: 0.5) {
            self.btnVerMas.isHidden = false
            self.layoutIfNeeded()
        }
    }
    
    func showInfo() {
        frameInfo.isHidden = true
        let infoView = PMInfoView.instanceFromNib()
        infoView.empresa = Session.sharedInstance.current.item?.empresa
        infoView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoView)
        
        infoView.trailingAnchor.constraint(equalTo: imgBigBanner.trailingAnchor, constant: -5).isActive = true
        infoView.topAnchor.constraint(equalTo: imgBigBanner.topAnchor, constant: 5).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: 155).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 155).isActive = true
    }
    
    @IBAction func verMas() {
        field.endEditing(true)
        hideKeyBoard()
    }
    
    @IBAction func tapInfo() {
        showInfo()
    }
    
    func showsKeyBoard(notification: NSNotification) {
        showKeyBoard()
    }
    
    func hideshowKeyBoard(notification: NSNotification) {
        hideKeyBoard()
    }
    
    class func instanceFromNib() -> PMSuministroView {
        return UINib(nibName: "SuministroView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMSuministroView
    }
}
