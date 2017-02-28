//
//  NivelTresViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelTresViewController: PMViewController {
    
    @IBOutlet weak var tableview        :UITableView!
    var servicios = [Servicio]() {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NivelTresViewController {
    
    override func initComponents() {
        if let categoria = Session.sharedInstance.current.categoria {
            self.servicios = categoria.servicios
            self.titleLabel.text = categoria.name
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let servicio = servicios[indexPath.row]
        Session.sharedInstance.current.servicio = servicio
        performSegue(withIdentifier: Constants.Storyboard.Segues.kToValidacionServicio, sender: nil)
    }
}

extension NivelTresViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntidadTableViewCell.identifier, for: indexPath) as! EntidadTableViewCell
        cell.servicio = servicios[indexPath.row]
        return cell
    }
}
