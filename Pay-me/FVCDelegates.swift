//
//  FVCDelegates.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension FavoritosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let service = self.serviciosFavoritos[indexPath.row]
        //self.callServiceConsultarRecibos(withService: service)
        
        if indexPath.row == 0 {
            Session.sharedInstance.flowType = .FIRST_TIME
        } else {
            Session.sharedInstance.flowType = .SECOND_TIME
        }
    }
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.serviciosFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier, for: indexPath) as! FavoritoTableViewCell
        
        let service = self.serviciosFavoritos[indexPath.row]
        cell.updateCellWith(service: service)
        
        return cell
    }
}

extension FavoritosViewController : FavoriteCellDelegate {
    
    func tapFavorite() {
        let notis = UIStoryboard.createSettings().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
}
