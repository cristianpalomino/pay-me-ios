//
//  ListaServiciosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class PMListaServiciosViewController: PMViewController {

    override var headerTitle: String {
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }

    var labels: [String] {
        guard let strings  = Session.sharedInstance.current.item?.label else {
            return ["NONE"]
        }
        return strings.components(separatedBy: ",")
    }
    
    var serviceIdentifier:  String?
    var imageBanner:        UIImage?
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageViewBanner: UIImageView!
    @IBOutlet weak var labelNameIdentifier: UILabel!
    @IBOutlet weak var labelIdentifier: UILabel!
    @IBOutlet weak var buttonRecordarServicio: UIButton!
    
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
        topView.addBottomBorder()
        buttonRecordarServicio.setGradientBackground()
        labelNameIdentifier.text = labels[1]
        labelIdentifier.text = self.serviceIdentifier
        imageViewBanner.image = self.imageBanner
        tableview.allowsMultipleSelection = true
        
        let nib = UINib(nibName: "ServiceTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: ServiceTableViewCell.identifier)
        tableview.reloadData()
    }
}

extension PMListaServiciosViewController {
    
    func showMessage() {
        let message = showMessage(type: .SERVICE_SAVED)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeA) {
            message.touchView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.Times.TimeB) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

extension PMListaServiciosViewController {
    
    @IBAction func tapRecordarServicios() {
        self.showHUD()
    }
}

extension PMListaServiciosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) { }
}

extension PMListaServiciosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.identifier, for: indexPath) as! ServiceTableViewCell
//        
//        let debt = self.apiResponse!.debts[indexPath.row]
//        cell.set(debt: debt)
        
        return cell
    }
}

