//
//  FavoritosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class FavoritosViewController: PMViewController {

    var favoritos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHeader(titles: ["Publicas", "Privadas"])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initComponents() {
        favoritos = ["0","1","2","3","4"]
    }
}

extension FavoritosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritoTableViewCell.identifier, for: indexPath) as! FavoritoTableViewCell
        //cell.title = favoritos[indexPath.row]
        return cell
    }
}

