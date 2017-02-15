//
//  ServicesViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension SuministroViewController : ConsultarDeudasDelegate {
    
    func serviceSuccess(response: ResponseConsultarDeudas) {
        hideHUD()
    }
    
    func serviceFailed(error: PaymeError) {
        hideHUD()
        showErrorView(pmError: error)
    }
}
