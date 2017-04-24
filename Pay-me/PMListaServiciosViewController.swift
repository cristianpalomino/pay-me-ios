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

    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }

    var apiResponse:        ResponseConsultarDeudas?
    var serviceIdentifier:  String?
    var imageBanner:        UIImage?
    
    @IBOutlet weak var tableview:               UITableView!
    @IBOutlet weak var imageViewBanner:         UIImageView!
    @IBOutlet weak var labelNameIdentifier:     UILabel!
    @IBOutlet weak var labelIdentifier:         UILabel!
    @IBOutlet weak var buttonRecordadServicio:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMListaServiciosViewController {
    
    override func initComponents() {
        super.initComponents()
        self.labelIdentifier.text = self.serviceIdentifier
        self.imageViewBanner.image = self.imageBanner
        self.tableview.allowsMultipleSelection = true
        self.tableview.reloadData()
    }
}

extension PMListaServiciosViewController {
    
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

extension PMListaServiciosViewController {
    
    @IBAction func tapRecordarServicios() {
        self.showHUD()
        self.callAddServices()
    }
}

extension PMListaServiciosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) { }
}

extension PMListaServiciosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apiResponse?.debts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as! ServiceTableViewCell
        
        let debt = self.apiResponse!.debts[indexPath.row]
        cell.set(debt: debt)
        
        return cell
    }
}

extension PMListaServiciosViewController: PMListaServiciosViewControllerServicesDelegate {
    
    internal func callAddServices() {
        
        if let response = self.apiResponse,
            let item = Session.sharedInstance.current.item,
            let identifier = self.serviceIdentifier {

            let indexs = self.tableview.indexPathsForSelectedRows?.map({ $0.row })
            var services = [Service]()
            
            indexs?.forEach {
                i in
                let debt = response.debts[i]
                let serviceAtributtes = [Service.Keys.kIdCompanySPS     : item.idCompany,
                                         Service.Keys.kIdServiceSPS     : debt.idService,
                                         Service.Keys.kServiceIdentifier: identifier,
                                         Service.Keys.kOwner            : response.clientName]
                let service = Service(json: JSON(serviceAtributtes))
                services.append(service)
            }
            
            let request = RequestAgregarServicio(services: services)

            PaymeServices.sharedInstance.serviciosServices.serviceAgregarServicio(request: request)
            PaymeServices.sharedInstance.serviciosServices.agregarServicioDelegate = self
        }
    }
}

extension PMListaServiciosViewController: AgregarServicioDelegate {
    
    internal func serviceSuccess(response: ResponseAgregarServicio) {
        self.hideHUD()
        self.showMessage()
    }
    
    internal func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}


protocol PMListaServiciosViewControllerServicesDelegate {
    
    func callAddServices()
}

