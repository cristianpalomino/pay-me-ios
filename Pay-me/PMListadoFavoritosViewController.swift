//
//  PMListadoFavoritosViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoFavoritosViewController: PMViewController {
    
    override var headerTitle: String {
        return "Mis Favoritos"
    }
    
    var titles: [(title: String,color: UIColor)] {
        return [("Todos",color: UIColor.appBlueColor()),
                ("Pendientes de Pago",color: UIColor.appBlueColor()),
                ("Pagado",color: UIColor.appBlueColor()),
                ("Pendiente de verficación",color: UIColor.appBlueColor()),
                ("Cargo automático",color: UIColor.appBlueColor())]
    }
    
    @IBOutlet weak var buttonAgregarServicios: UIButton!
    @IBOutlet weak var viewTitleStrip: PMTitleStrip!
    @IBOutlet weak var tableView: UITableView!
    
    var serviciosFavoritos = Session.sharedInstance.serviciosFavoritos
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.callServiceFavoritos()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMListadoFavoritosViewController {
    
    override func initComponents() {
        super.initComponents()
        self.viewTitleStrip.titles = self.titles
        let nib = UINib(nibName: "FavoritoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: FavoritoTableViewCell.identifier)
        self.buttonAgregarServicios.setGradientBackground()
    }
}

extension PMListadoFavoritosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapSelect")
    }
}

extension PMListadoFavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.serviciosFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier, for: indexPath) as! FavoritoTableViewCell
        
        let service = self.serviciosFavoritos[indexPath.row]
        cell.update(service: service)
        
        return cell
    }
}

extension PMListadoFavoritosViewController : FavoriteCellDelegate {
    
    func tapFavorite() {
        let notis = UIStoryboard.createSettings().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
}

extension PMListadoFavoritosViewController {
    
    internal func callServiceConsultarRecibos(withService service:Service) {
        if let codeService = service.serviceIdentifier {
            let request = RequestConsultarDeudas(idCompany: service.idCompanySPS,
                                                 idService: service.idServiceSPS,
                                                 serviceIdentifier: codeService)
            PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
            PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
            showHUD()
        }
    }
    
    internal func callServiceFavoritos() {
        let request = RequestConsultarServicios()
        PaymeServices.sharedInstance.serviciosServices.apiConsultarServicios(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarServiciosDelegate = self
    }
}

extension PMListadoFavoritosViewController: ConsultarServiciosDelegate {
    
    func serviceSuccess(response: ResponseConsultarServicios) {
        Session.sharedInstance.serviciosFavoritos = response.services
        
        let source = Session.sharedInstance.serviciosFavoritos
        let local  = self.serviciosFavoritos
        
        let setSource = Set(source)
        let newServices = Array(setSource.subtracting(self.serviciosFavoritos))
        
        if !newServices.isEmpty {
            
            self.serviciosFavoritos.append(contentsOf: newServices)
            var indexPaths = [IndexPath]()
            
            for i in 0...(newServices.count - 1) {
                indexPaths.append(IndexPath(row: local.count + i , section: 0))
            }
            
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: indexPaths, with: .automatic)
            self.tableView.endUpdates()
        }
    }
}

extension PMListadoFavoritosViewController: ConsultarDeudasDelegate {
    
    func serviceSuccess(response: ResponseConsultarDeudas) {
        self.toSegue(identifier: Constants.Storyboard.Segues.kRecibo)
    }
}

extension PMListadoFavoritosViewController {
    
    func serviceFailed(error: PaymeError) {
        debugPrint(error)
    }
}
