//
//  DetalleSuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import AlamofireImage
import SwiftyJSON
import UIKit

class PMDetalleSuministroViewController: PMViewController {
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    var apiResponse             :ResponseConsultarDeudas?
    var serviceIdentifier       :String?
    var hasManyServices         :Bool = false
    
    @IBOutlet weak var bannerView           : UIImageView!
    @IBOutlet weak var buttonView           : UIButton!
    @IBOutlet weak var txtIndentifier       : PMTextField!
    @IBOutlet weak var txtName              : PMTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMDetalleSuministroViewController {
    
    override func initComponents() {
        super.initComponents()
        self.txtIndentifier.setPMTheme()
        self.txtName.setPMTheme()
        
        if let response = apiResponse, let identifier = serviceIdentifier {
            self.hasManyServices = response.debts.count > 1
            
            self.txtName.text = response.clientName
            self.txtIndentifier.text = identifier
            self.defineButton()
            
            if let currentService = Session.sharedInstance.current.item {
                self.loadBanner(url: currentService.logo_2)
                //self.titleLabel.text = currentService.empresa.name
            }
        }
    }
}

extension PMDetalleSuministroViewController {
    
    func loadBanner(url :String) {
        let urlLogo = URL(string: url)!
        self.bannerView.af_setImage(withURL: urlLogo, placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.2))
    }
    
    func defineButton() {
        if hasManyServices {
            self.buttonView.setTitle("Agregar Servicio", for: .normal)
        } else {
            self.buttonView.setTitle("Recordar Servicio", for: .normal)
        }
    }
    
    func showMessage() {
        let message = showMessage(type: .SERVICE_SAVED)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.tabBarController!.selectedIndex = 0
            }
        }
    }
}

extension PMDetalleSuministroViewController: DetalleSuministroViewControllerServicesDelegate {
    
    internal func callAddServices() {
        
        if let response = self.apiResponse,
            let item = Session.sharedInstance.current.item,
            let identifier = self.serviceIdentifier {
            
            let serviceAtributtes = [Service.Keys.kIdCompanySPS     : item.idCompany,
                                     Service.Keys.kIdServiceSPS     : item.idService,
                                     Service.Keys.kServiceIdentifier: identifier,
                                     Service.Keys.kOwner            : response.clientName]
            let service = Service(json: JSON(serviceAtributtes))
            let request = RequestAgregarServicio(services: [service])
            
            PaymeServices.sharedInstance.serviciosServices.serviceAgregarServicio(request: request)
            PaymeServices.sharedInstance.serviciosServices.agregarServicioDelegate = self
        }
    }
}

extension PMDetalleSuministroViewController {
    
    @IBAction func tapButton() {
        if hasManyServices {
            self.toSegue(identifier: Constants.Storyboard.Segues.kListServices)
        } else {
            self.callAddServices()
        }
    }
}

extension PMDetalleSuministroViewController: AgregarServicioDelegate {
    
    internal func serviceSuccess(response: ResponseAgregarServicio) {
        self.showMessage()
    }
    
    internal func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}

protocol DetalleSuministroViewControllerServicesDelegate {
    
    func callAddServices()
}

