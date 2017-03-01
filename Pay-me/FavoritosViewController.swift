//
//  FavoritosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritosViewController: PMViewController {
    
    @IBOutlet weak var tableView :UITableView!
    
    var serviciosFavoritos = [Service]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callServiceFavoritos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FavoritosViewController {
    
    override func initComponents() {
        
    }
}

extension FavoritosViewController {
    
    
}
