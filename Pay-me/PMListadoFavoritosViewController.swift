//
//  PMListadoFavoritosViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoFavoritosViewController: PMViewController {    
    
    var listadoView = PMListadoView.instanceFromNib()
    
    override var headerTitle: String {
        return "Mis Favoritos"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        request()
    }
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
    }
    
    func request() {
        Request.getFavoritos(completionHandler: {
            (response: ResponseHandlerFavoritos) in

            self.listadoView.favoritos = response
            self.listadoView.reloadTableView()
        }, errorHandler: {
            error in
            
        })
    }
    
    override func initComponents() {        
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        
        let onTouchAdd: (() -> Void)? = {
            self.toSegue(identifier: "toPrimero")
        }
        
        let onTouchPay: ((_ favorito: Favorito) -> Void)?  = { favorito in
            let vc = PMListaRecibosViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        listadoView.initUI()
        listadoView.onTouchAdd = onTouchAdd
        listadoView.onTouchPay = onTouchPay
        add(mainView: listadoView)
    }
}
