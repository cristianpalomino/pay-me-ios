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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    var detalleView: PMDetalleView!
    
    func prepare() {
        detalleView = PMDetalleView.instanceFromNib()
        detalleView.initUI(viewController: self)
        add(mainView: detalleView)
    }
    
    func callAddService() {
        guard
            let service = detalleView.selectedService,
            let owner = responseConsult?.name,
            let identifier = self.identifier else { return }
        
        Request.addServices(services: [service], owner: owner, identifier: identifier, completionHandler: { response in
            self.showMessage()
        }, errorHandler: { error in
            
        })
    }
    
    func showMessage() {
        let message = UIStoryboard.createMessage()
        present(message, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeA) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeB) {
                //self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    var responseConsult: ResponseHandlerDebtConsult?
    var identifier: String?
}
