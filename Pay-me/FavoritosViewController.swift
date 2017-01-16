//
//  FavoritosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritosViewController: PMViewController {
    
    var favoritos = [Favorito]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FavoritosViewController {
    
    override func initComponents() {
        favoritos = [Favorito(data: ["upc-logo","Universidad Karolina","UPC","WLAN38472 F","pendiente","1,548.70"]),
                     Favorito(data: ["entel-logo","Celular Juan","Entel Celulares","982 366 740 F","cargo","1,548.70"]),
                     Favorito(data: ["zeta-logo","Gas Casa Playa","Zeta Gas","WLAN38472 F","verficacion",""])]
        
        //super.titles = ["Todos", "Pendientes de pago"]
        //super.initHeader()
    }
}

extension FavoritosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            Session.sharedInstance.flowType = .FIRST_TIME
        } else {
            Session.sharedInstance.flowType = .SECOND_TIME
        }
        
        self.performSegue(withIdentifier: "kRecibo", sender: nil)
    }
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier, for: indexPath) as! FavoritoTableViewCell
        cell.favoriteCellDelegate = self
        cell.item = favoritos[indexPath.row]
        return cell
    }
}

extension FavoritosViewController : FavoriteCellDelegate {
    
    func tapFavorite() {
        let notis = UIStoryboard.createSettings().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
}

