//
//  NotificacionesViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NotificacionesViewController: PMViewController {
    
    var notificaciones = [Notificacion]()

    @IBOutlet weak var btnPagar: UIButton!
    
    //tableview.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension NotificacionesViewController {
    
    override func initComponents() {
        notificaciones = [Notificacion(data: ["upc-logo","Universidad Karolina","Vto: 31 dic 2016","WLAN38472 F","pendiente","1,548.70"]),
                     Notificacion(data: ["entel-logo","Celular Juan","Vto: 05 ene 2017","982 366 740 F","cargo","1,548.70"]),
                     Notificacion(data: ["zeta-logo","Gas Casa Playa","Vto: 11 feb 2017","WLAN38472 F","verficacion",""]),
                     Notificacion(data: ["zeta-logo","Gas Casa Playa","Registro de Seguridad","WLAN38472 F","verficacion",""])
        
        ]
    }
}

extension NotificacionesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension NotificacionesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificacionTableViewCell.identifier, for: indexPath) as! NotificacionTableViewCell
        
        cell.leftUtilityButtons = self.leftButton() as! [Any]
        cell.rightUtilityButtons = self.rigthButton() as! [Any]
        
        cell.item = notificaciones[indexPath.row]
        
        return cell
    }
    
    
    //MARK : Pay Button
    func rigthButton() -> NSArray{
        let rigthUtilityButton : NSMutableArray = NSMutableArray()
        
        let payIcon = UIImage(named:"default")
        rigthUtilityButton.sw_addUtilityButton(with: UIColor.appBlueColor(), icon: payIcon)
        
        return rigthUtilityButton
    }
    
    //MARK : Delete Button
    func leftButton() -> NSArray{
        let leftUtilityButton : NSMutableArray = NSMutableArray()
        let deleteIcon = UIImage(named:"default")
        leftUtilityButton.sw_addUtilityButton(with: UIColor.appRedColor(), icon: deleteIcon)
        
        return leftUtilityButton
    }
    


}
