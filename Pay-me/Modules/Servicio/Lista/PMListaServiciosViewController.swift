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
        guard let title = Session.shared.current.item?.empresa.shortName else {
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
    }
    
    func hello() {
        
    }
    
    func callAddService() {
        guard
            let owner = responseConsult?.name,
            let identifier = self.identifier else { return }
        
        let services = listaServicios.selectedServices
        PaymeService.addServices(services: services, owner: owner, identifier: identifier, completion: { response in
            let messages: (title: String, description: String)
            switch response {
            case .success:
                messages = ("!Servicio guardado!", "To you how all this mistaken idea of denouncing pleasure and praising pain.")
            case .failure(let error):
                messages = ("!Error!", error.localizedDescription)
            }
            self.showMessage(information: messages)
        })
    }
    
    func showMessage(information: (title: String, description: String)) {
        let message = UIStoryboard.createMessage(information: information)
        present(message, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeA) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeB) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    var responseConsult: (name: String, services: [Service])?
    var identifier: String?
}


