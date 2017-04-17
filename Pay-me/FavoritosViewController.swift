//
//  FavoritosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritosViewController: PMViewController {
    
    @IBOutlet weak var titleView:   PMTitleView!
    @IBOutlet weak var tableView:   UITableView!
    
    var serviciosFavoritos = Session.sharedInstance.serviciosFavoritos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callServiceFavoritos()
        self.titleView.titleLabel.text = TitleTriger.favoritos.titleLabelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FavoritosViewController {
    
    override func initComponents() {
        
    }
}

