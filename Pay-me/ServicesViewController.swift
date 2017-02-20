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
        performSegue(withIdentifier: Constants.Storyboard.Segues.kDetailSuministro, sender: nil)
    }
    
    func serviceFailed(error: PaymeError) {
        print(error.answerCode)
        hideHUD()
        showErrorView(pmError: error)
    }
}
