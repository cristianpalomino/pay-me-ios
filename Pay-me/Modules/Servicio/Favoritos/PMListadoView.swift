//
//  PMListadoView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 10/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListadoView: UIView {
    
    var onTouchAdd: (() -> Void)?
    var onTouchPay: ((_ favorito: Favorito) -> Void)?
    
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
        tableView.setEditing(false, animated: true)
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
    
    @IBAction func tapAdd() {
        onTouchAdd?()
    }
}

extension PMListadoView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

extension PMListadoView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let img: UIImage = UIImage(named: "ic-card-white")!
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.pmDeepSkyBlue.cgColor)
        context!.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        img.draw(in: CGRect(x:24, y:22, width:21, height:21))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let deleteRowAction = UITableViewRowAction(style: .normal, title: "        ") { rowAction, indexPath in
            self.tableView.setEditing(false, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5,
                                          execute: {
                self.onTouchPay?(self.favoritos[indexPath.row])
            })
        }
        
        deleteRowAction.backgroundColor = UIColor(patternImage: newImage)
        
        return  [deleteRowAction]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
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
