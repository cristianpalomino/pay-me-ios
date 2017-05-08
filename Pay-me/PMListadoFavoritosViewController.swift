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
    
    var favoritos = [Favorito]()
    
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
}

extension PMListadoFavoritosViewController {
    
    func request() {
        Request.getFavoritos {
            response in
            if let favoritos = response.value {
                self.favoritos = favoritos
                self.tableView.reloadData()
            } else {
                
            }
        }
    }
    
    override func initComponents() {        
        super.initComponents()
        viewTitleStrip.titles = self.titles
        let nib = UINib(nibName: "FavoritoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FavoritoTableViewCell.identifier)
        buttonAgregarServicios.setGradientBackground()
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
        return self.favoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier, for: indexPath) as! FavoritoTableViewCell
        let favorito = favoritos[indexPath.row]
        cell.update(favorito: favorito)
        return cell
    }
}
