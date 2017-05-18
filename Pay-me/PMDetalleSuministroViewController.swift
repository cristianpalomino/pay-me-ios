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
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? PMListaServiciosViewController {
            dvc.identifier = identifier
            dvc.responseConsult = responseConsult
        }
    }
}
