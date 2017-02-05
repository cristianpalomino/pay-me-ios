//
//  NivelTresViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelTresViewController: PMViewController {
    
    var empresas = [Empresa]() {
        didSet {
            self.tableview.reloadData()
        }
    }
    
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
        if let categoria = Session.sharedInstance.current.categoria {
            empresas = categoria.empresas
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
        let empresa = empresas[indexPath.row]
        Session.sharedInstance.current.empresa = empresa
        
        if empresa.servicios.count == 1 {
            performSegue(withIdentifier: Constants.Storyboard.Segues.kToValidacionServicio, sender: nil)
        } else {
            
        }
    }
}

extension NivelTresViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empresas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntidadTableViewCell.identifier, for: indexPath) as! EntidadTableViewCell
        cell.empresa = empresas[indexPath.row]
        return cell
    }
}
