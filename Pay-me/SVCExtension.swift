//
//  SVCDelegates.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension SuministroViewController {
    
    @IBAction func tapConsultar() {
        self.callGetServices()
    }
    
    @IBAction func tapInfo() {
        showInformation()
    }
}

extension SuministroViewController {
    
    func showInformation() {
        if let currentService = Session.sharedInstance.current.item {
            //self.titleLabel.text = currentService.name
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.viewOpenInfo.isHidden = true
            self.viewInfo.isHidden = false
        })
    }
    
    func loadImages() {
        if let currentService = Session.sharedInstance.current.item {
            let urlLogo1 = URL(string: currentService.empresa.logo)!
            let urlLogo2 = URL(string: currentService.logo_2)!
            self.imageBigBannerView.af_setImage(withURL: urlLogo1, placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.2))
            self.imageBannerView.af_setImage(withURL: urlLogo2, placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.2))
        }
    }
    
    func initErrorView() {
        let errorViewOrigin = self.txtIndentifier.frame.origin.y + self.txtIndentifier.frame.size.height + 32
        let frameErrorView = CGRect(x: 20, y: Int(errorViewOrigin), width: Int(self.txtIndentifier.frame.width), height: 100)
        self.errorView = PMErrorView(frame: frameErrorView)
        self.errorView.isHidden = true
        self.mainView.addSubview(errorView)
    }
    
    func showErrorView(pmError :PaymeError) {
        self.hideHUD()
        self.errorView.pmError = pmError
        self.errorView.isHidden = false
    }
}
