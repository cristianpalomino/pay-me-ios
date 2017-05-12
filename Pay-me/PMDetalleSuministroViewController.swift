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
    
    var labels: [String] {
        guard let strings  = Session.sharedInstance.current.item?.label else {
            return ["NONE"]
        }
        return strings.components(separatedBy: ",")
    }
    
//    var apiResponse             :ResponseConsultarDeudas?
    var serviceIdentifier       :String?
    var hasManyServices         :Bool = false
    
    @IBOutlet weak var buttonAgregarServicio: UIButton!
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
//        if identifier == Constants.Storyboard.Segues.kToListDetailSuministro {
//            let listaServiciosController = segue.destination as! PMListaServiciosViewController
//            if self.apiResponse != nil {
//                listaServiciosController.serviceIdentifier = self.txtIndentifier.text!
////                listaServiciosController.apiResponse = self.apiResponse
//                listaServiciosController.imageBanner = self.bannerView.image
//            }
//        }
    }
}

extension PMDetalleSuministroViewController {
    
    override func initComponents() {
        super.initComponents()
        bannerView.addBottomBorder()
        buttonAgregarServicio.setGradientBackground()

        
//        if let response = apiResponse, let identifier = serviceIdentifier {
//            self.hasManyServices = response.debts.count > 1
//
//            self.txtName.text = response.clientName
//            self.txtIndentifier.text = identifier
//            self.defineButton()
//            
//            if let currentService = Session.sharedInstance.current.item {
//                self.loadBanner(url: currentService.logo_2)
//            }
//        }
    }
}

extension PMDetalleSuministroViewController {
    
    func loadBanner(url :String) {
        let urlLogo = URL(string: url)!
        self.bannerView.af_setImage(withURL: urlLogo, placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.2))
    }
    
    func defineButton() {
        if self.hasManyServices {
            buttonAgregarServicio.setImage(UIImage(named: "icono_agregar-white"), for: .normal)
            buttonAgregarServicio.setTitle("  Agregar Servicio", for: .normal)
        } else {
            buttonAgregarServicio.setImage(UIImage(named: "icono_recordar_servicio"), for: .normal)
            self.buttonAgregarServicio.setTitle("  Recordar Servicio", for: .normal)
        }
    }
    
    func showMessage() {
        let message = showMessage(type: .SERVICE_SAVED)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeA) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeB) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

extension PMDetalleSuministroViewController {
    
    @IBAction func tapAgregarServicio() {
        if self.hasManyServices {
            self.toSegue(identifier: Constants.Storyboard.Segues.kToListDetailSuministro)
        } else {
            self.showHUD()
//            self.callAddServices()
        }
    }
    
    @IBAction func tapNoEsMiServicio() {
        self.tapBack()
    }
}
