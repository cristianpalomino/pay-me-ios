//
//  NivelTresViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNivelTresViewController: PMViewController {
    
    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.categoria?.name else {
            return "NONE"
        }
        return title
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    var items: [Item]? {
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMNivelTresViewController {
    
    override func initComponents() {
        super.initComponents()
        self.items = Session.sharedInstance.current.categoria?.items
    }
}

extension PMNivelTresViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items?[indexPath.row]
        Session.sharedInstance.current.item = item
        performSegue(withIdentifier: Constants.Storyboard.Segues.kToValidacionServicio, sender: nil)
    }
}

extension PMNivelTresViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Constants.Utils.ABECEDARIO
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntidadTableViewCell.identifier, for: indexPath) as! EntidadTableViewCell
        cell.servicio = self.items?[indexPath.row]
        return cell
    }
}
