//
//  NivelTresViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelTresViewController: PMViewController {
    
    var entidades = [String]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NivelTresViewController {
    
    override func initComponents() {
        entidades = ["UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas",
                     "UPC Universidad Peruana de Ciencias Aplicadas"]
    }
}

extension NivelTresViewController {

    @IBAction func tapBuscar() {
        
    }
}

extension NivelTresViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension NivelTresViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entidades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntidadTableViewCell.identifier, for: indexPath) as! EntidadTableViewCell
        cell.title = entidades[indexPath.row]
        return cell
    }
}
