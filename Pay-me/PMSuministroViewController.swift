//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import AlamofireImage

class PMSuministroViewController: PMViewController {
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    //Api
    weak var apiResponse    :ResponseConsultarDeudas?
    
    //Constraints
    @IBOutlet weak var mainViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var consultButtonBottomConstraint: NSLayoutConstraint!
    
    //Views
    @IBOutlet weak var buttonConsultar:     UIButton!
    @IBOutlet weak var viewOpenInfo:        UIView!
    @IBOutlet weak var viewInfo:            PMInfoView!
    @IBOutlet weak var mainView:            UIView!
    @IBOutlet weak var txtIndentifier:      PMTextField!
    @IBOutlet weak var btnInfo:             UIButton!
    @IBOutlet weak var bigBannerView:       UIView!
    @IBOutlet weak var imageBigBannerView:  UIImageView!
    @IBOutlet weak var bannerView:          UIView!
    @IBOutlet weak var imageBannerView:     UIImageView!
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == Constants.Storyboard.Segues.kDetailSuministro {
            let detalleViewController = segue.destination as! PMDetalleSuministroViewController
            if self.apiResponse != nil {
                detalleViewController.serviceIdentifier = self.txtIndentifier.text!
                detalleViewController.apiResponse = self.apiResponse
            }
        }
    }
}

extension PMSuministroViewController {
    
    override func initComponents() {
        super.initComponents()
        self.buttonConsultar.setGradientBackground()
        self.txtIndentifier.setPMTheme()
        self.loadImages()
    }
}

extension PMSuministroViewController {
    
    @IBAction func tapConsultar() {
        self.callGetServices()
    }
    
    @IBAction func tapInfo() {
        self.showInformation()
    }
}

extension PMSuministroViewController {
    
    func showInformation() {
        self.viewInfo.setInformation(empresa: Session.sharedInstance.current.item?.empresa)
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
        let errorViewOrigin = self.txtIndentifier.frame.origin.y + self.txtIndentifier.frame.size.height + 20
        let frameErrorView = CGRect(x: 32, y: Int(errorViewOrigin), width: Int(self.txtIndentifier.frame.width), height: 100)
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

extension PMSuministroViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.mainViewTopConstraint.constant = -(self.bigBannerView.frame.height)
                self.consultButtonBottomConstraint.constant = keyboardSize.size.height - 49
                self.errorView?.isHidden = true
                UIView.animate(withDuration: 0.05, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    override func keyboardDidHide() {
        self.consultButtonBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.05, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

extension PMSuministroViewController: ConsultarDeudasDelegate {
    
    func serviceSuccess(response: ResponseConsultarDeudas) {
        self.apiResponse = response
        self.toSegue(identifier: Constants.Storyboard.Segues.kDetailSuministro)
    }
    
    func serviceFailed(error: PaymeError) {
        print(error.answerCode)
        showErrorView(pmError: error)
    }
}

extension PMSuministroViewController: SuministroViewControllerServicesDelegate {
    
    func callGetServices() {
        guard txtIndentifier.text?.trimmed != "" else {
            print("Add Identifier")
            return
        }
        
        txtIndentifier.resignFirstResponder()
        
        let identifier  = txtIndentifier.text!
        let current     = Session.sharedInstance.current
        let idCompany   = current.item!.idCompany!
        let idService   = current.item!.idService!
        
        let request = RequestConsultarDeudas(idCompany: idCompany, idService: idService, serviceIdentifier: identifier)
        
        PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
        
        showHUD()
    }
}

protocol SuministroViewControllerServicesDelegate {
    
    func callGetServices()
}
