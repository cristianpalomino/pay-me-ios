//
//  ExtensionPMViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 18/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation

protocol PMViewControllerProtocol {
    
    var title: String { get }
    
    func tapPerfil()
    func tapNotifications()
    func tapBack()
    func tapSearch()
}

protocol MessageViewControllerProtocol {
    
    var message: String { get }
    var image: UIImage { get }
    var description: String { get }
    
    func tapClose()
}

extension PMViewControllerProtocol where Self:PMViewController {
    
    func tapPerfil() {
        let notis = UIStoryboard.createNotificaciones().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
    
    func tapNotifications() {
        let notis = UIStoryboard.createNotificacionesHome().topViewController!
        self.navigationController?.show(notis, sender: self)
    }
    
    func tapBack() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func tapSearch() {
        print("TapSearch")
    }
}
