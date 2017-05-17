//
//  PMListaServicios.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 15/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListaServiciosView: UIView {

    @IBOutlet weak var frameTop: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var labelIdentifier: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainButton: UIButton!
    
    var labels: [String] {
        guard let strings  = Session.sharedInstance.current.item?.label else {
            return ["NONE"]
        }
        return strings.components(separatedBy: ",")
    }
    
    func initUI() {
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
        if let item = Session.sharedInstance.current.item {
            let url = URL(string: item.logo_2)!
            imgBanner.af_setImage(withURL: url,
                                  placeholderImage: nil,
                                  filter: nil,
                                  imageTransition: .crossDissolve(0.2))
        }
    }

    @IBAction func tapMain() {
        
//        let indexs = tableView.indexPathsForSelectedRows?.map({ $0.row })
//        var servicios = [Service]()
//        indexs?.forEach {
//            i in
//            servicios.append(self.servicios[i])
//        }
        
    }
    
    class func instanceFromNib() -> PMListaServiciosView {
        return UINib(nibName: "ListaServicios",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMListaServiciosView
    }
}


