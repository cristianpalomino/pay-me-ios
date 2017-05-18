//
//  ListaServiciosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class PMListaServiciosViewController: PMViewController {

    var listaServicios: PMListaServiciosView!
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        listaServicios = PMListaServiciosView.instanceFromNib()
        listaServicios.initUI(viewController: self)
        add(mainView: listaServicios)
        //listaServicios.mainButton.target(forAction: , withSender: <#T##Any?#>)
    }
    
    func hello() {
        
    }
    
    func callAddService() {
        guard
            let owner = responseConsult?.name,
            let identifier = self.identifier else { return }
        
        let services = listaServicios.selectedServices
        Request.addServices(services: services, owner: owner, identifier: identifier, completionHandler: { response in
            let information = ("!Servicio guardado!", "To you how all this mistaken idea of denouncing pleasure and praising pain.")
            self.showMessage(information: information)
        }, errorHandler: { error in
            let information = ("!Error!", error.localizedDescription)
            self.showMessage(information: information)
        })
    }
    
    func showMessage(information: PMMessageViewController.Information) {
        let message = UIStoryboard.createMessage(information: information)
        present(message, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeA) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeB) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    var responseConsult: ResponseHandlerDebtConsult?
    var identifier: String?
}


