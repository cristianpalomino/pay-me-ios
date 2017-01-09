//
//  ListaPagosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 9/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class ListaPagosViewController: PMViewController {
    
    var pagos = [Pay]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ListaPagosViewController {
    
    override func initComponents() {
        pagos = [Pay(name: "Unviersidad Karolina", entidad: "UPC", identifier: "WLAN 92132", type: .SUCCESS),
                Pay(name: "Celular Personal", entidad: "Entel", identifier: "932 366 740", type: .SUCCESS),
                Pay(name: "Luz Casa", entidad: "Luz del Sur", identifier: "F9 19 129", type: .SUCCESS),
                Pay(name: "Restaurante Anticucho", entidad: "Restaurante", identifier: "Exclusivo", type: .SUCCESS)]
    }
}


extension ListaPagosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showMessage(type: .SERVICE_SAVED)
    }
}

extension ListaPagosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pagos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PayTableViewCell.identifier, for: indexPath) as! PayTableViewCell
        cell.item = pagos[indexPath.row]
        return cell
    }
}
