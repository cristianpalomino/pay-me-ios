//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Material
import Alamofire

class SuministroViewController: PMViewController {
    
    //Constraints
    @IBOutlet weak var mainViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var consultButtonBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var viewOpenInfo         : UIView!
    @IBOutlet weak var viewInfo             : UIView!
    
    @IBOutlet weak var mainView             : UIView!
    @IBOutlet weak var txtIndentifier       : PMTextField!
    @IBOutlet weak var btnInfo              : UIButton!
    @IBOutlet weak var bigBannerView        : UIView!
    @IBOutlet weak var imageBigBannerView   : UIImageView!
    @IBOutlet weak var bannerView           : UIView!
    @IBOutlet weak var imageBannerView      : UIImageView!
    var errorView :PMErrorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initErrorView()
    }
}

extension SuministroViewController {
    
    override func initComponents() {
        self.txtIndentifier.setPMTheme()
        self.loadImages()
    }
}

extension SuministroViewController {
    
    @IBAction func tapConsultar() {
        let identifier = txtIndentifier.text!.trimmed
        if identifier != "" {
            txtIndentifier.resignFirstResponder()
            callServiceConsultarDeudas(identifier: identifier)
        } else {
            
        }
    }
    
    @IBAction func tapInfo() {
        showInformation()
    }
}

extension SuministroViewController {
    
    func showInformation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.viewOpenInfo.isHidden = true
            self.viewInfo.isHidden = false
        })
    }
    
    func callServiceConsultarDeudas(identifier :String) {
        let current = Session.sharedInstance.current
        let idCompany = current.servicio!.empresa.idCompany!
        let idService = current.servicio!.idService!
        let request = RequestConsultarDeudas(idCompany: idCompany, idService: idService, serviceIdentifier: identifier)
        PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
        showHUD()
    }
    
    func loadImages() {
        if let currentService = Session.sharedInstance.current.servicio {
            Alamofire.request(currentService.empresa.logo).responseData {
                response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    self.imageBigBannerView.image = image
                }
            }
            Alamofire.request(currentService.logo_2).responseData {
                response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    self.imageBannerView.image = image
                }
            }
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
        self.errorView.pmError = pmError
        self.errorView.isHidden = false
    }
}
