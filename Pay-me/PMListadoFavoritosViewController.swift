//
//  PMListadoFavoritosViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoFavoritosViewController: PMViewController {    
    
    var listadoView: PMListadoView?
    
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
        Request.getFavoritos {
            response in
            if let favoritos = response.value {
                self.listadoView?.favoritos = favoritos
            } else {
                
            }
        }
    }
    
    override func initComponents() {        
        super.initComponents()
        listadoView = PMListadoView.instanceFromNib()
        listadoView?.initUI()
        if let lv = listadoView {
            add(mainView: lv)
        }
    }
}
