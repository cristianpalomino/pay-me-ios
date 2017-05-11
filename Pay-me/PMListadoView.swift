//
//  PMListadoView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 10/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoView: UIView {
    
    var titles: [(title: String,color: UIColor)] {
        return [("Todos",color: UIColor.appBlueColor()),
                ("Pendientes de Pago",color: UIColor.appBlueColor()),
                ("Pagado",color: UIColor.appBlueColor()),
                ("Pendiente de verficación",color: UIColor.appBlueColor()),
                ("Cargo automático",color: UIColor.appBlueColor())]
    }
    
    var favoritos = [Favorito]() {
        didSet {
            reloadTableView()
        }
    }

    @IBOutlet weak var titleStrip: PMTitleStrip!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainButton: UIButton!
    
    func initUI() {
        registerCell()
        mainButton.setGradientBackground()
        titleStrip.titles = titles
    }
    
    class func instanceFromNib() -> PMListadoView {
        return UINib(nibName: "ListadoView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMListadoView
    }
    
    func registerCell() {
        let nib = UINib(nibName: "FavoritoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FavoritoTableViewCell.identifier)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension PMListadoView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapSelect")
    }
}

extension PMListadoView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier,
                                                 for: indexPath) as! FavoritoTableViewCell
        let favorito = favoritos[indexPath.row]
        cell.update(favorito: favorito)
        return cell
    }
}
