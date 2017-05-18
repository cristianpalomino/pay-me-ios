//
//  PMListadoFavoritosViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoFavoritosViewController: PMViewController {    
    
    var listadoView: PMListadoView!
    
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
            
            self.listadoView!.favoritos = response
            self.listadoView!.reloadTableView()
        }, errorHandler: {
            error in
            
        })
    }
    
    override func initComponents() {        
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        listadoView = PMListadoView.instanceFromNib()
        listadoView.initUI()
        add(mainView: listadoView)
        listadoView.mainButton.addTarget(self, action: #selector(push), for: .touchUpInside)
    }
    
    func push() {
        toSegue(identifier: "toPrimero")
    }
}
