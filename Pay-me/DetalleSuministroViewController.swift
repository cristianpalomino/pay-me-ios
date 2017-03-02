//
//  DetalleSuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import AlamofireImage
import UIKit

class DetalleSuministroViewController: PMViewController {
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

extension DetalleSuministroViewController {
    
    override func initComponents() {
        self.txtIndentifier.setPMTheme()
        self.txtName.setPMTheme()
        
        if let response = apiResponse, let identifier = serviceIdentifier {
            self.hasManyServices = response.debts.count > 1
            
            self.txtName.text = response.clientName
            self.txtIndentifier.text = identifier
            self.defineButton()
            
            if let currentService = Session.sharedInstance.current.item {
                self.loadBanner(url: currentService.logo_2)
                self.titleLabel.text = currentService.name
            }
        }
    }
}

extension DetalleSuministroViewController {
    
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
}
