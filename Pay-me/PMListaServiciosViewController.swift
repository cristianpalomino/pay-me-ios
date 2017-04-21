//
//  ListaServiciosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListaServiciosViewController: PMViewController {

    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    var apiResponse:        ResponseConsultarDeudas?
    var serviceIdentifier:  String?
    var imageBanner:        UIImage?
    
    @IBOutlet weak var tableview:               UITableView!
    @IBOutlet weak var imageViewBanner:         UIImageView!
    @IBOutlet weak var labelNameIdentifier:     UILabel!
    @IBOutlet weak var labelIdentifier:         UILabel!
    @IBOutlet weak var buttonRecordadServicio:  UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PMListaServiciosViewController {
    
    override func initComponents() {
        super.initComponents()
        self.imageViewBanner.image = self.imageBanner
        self.tableview.reloadData()
    }
}

extension PMListaServiciosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showMessage(type: .SERVICE_SAVED)
    }
}

extension PMListaServiciosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apiResponse?.debts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as! ServiceTableViewCell
        
        let debt = self.apiResponse!.debts[indexPath.row]
        cell.set(debt: debt)
        
        return cell
    }
}


