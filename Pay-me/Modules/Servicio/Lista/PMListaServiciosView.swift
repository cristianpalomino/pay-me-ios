//
//  PMListaServicios.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 15/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListaServiciosView: UIView {
    
    var services = [Service]()
    var selectedServices = [Service]()
    var pmListaViewController: PMListaServiciosViewController!
    
    var viewController: UIViewController {
        get {
           return pmListaViewController
        }
        set (newValue) {
            pmListaViewController = newValue as! PMListaServiciosViewController
            if let services = pmListaViewController.responseConsult?.services {
                self.services = services
                tableView.reloadData()
                labelIdentifier.text = pmListaViewController.identifier
            }
        }
    }

    @IBOutlet weak var frameTop: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var labelIdentifier: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainButton: UIButton!
    
    var labels: [String] {
        guard let strings  = Session.shared.current.item?.label else {
            return ["NONE"]
        }
        return strings.components(separatedBy: ",")
    }
    
    func initUI(viewController: PMListaServiciosViewController) {
        self.viewController = viewController
        prepare()
        loadBanners()
        borders()
    }
    
    func prepare() {
        mainButton.setGradientBackground()
        loadBanners()
        borders()
        registerCell()
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ServiceTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ServiceTableViewCell.identifier)
    }
    
    func borders() {
        frameTop.addBottomBorder()
    }
    
    func loadBanners() {
        if let item = Session.shared.current.item {
            let url = URL(string: item.logo_2)!
            imgBanner.af_setImage(withURL: url,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }

    @IBAction func tapMain() {
        let indexs = tableView.indexPathsForSelectedRows?.map({ $0.row })
        indexs?.forEach {
            i in
            selectedServices.append(services[i])
        }
        
        if !services.isEmpty {
            pmListaViewController.callAddService()
        }
    }
    
    class func instanceFromNib() -> PMListaServiciosView {
        return UINib(nibName: "ListaServicios",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMListaServiciosView
    }
}

extension PMListaServiciosView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) { }
}

extension PMListaServiciosView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier,
                                                 for: indexPath) as! ServiceTableViewCell
        let service = services[indexPath.row]
        cell.set(service: service)
        return cell
    }
}
