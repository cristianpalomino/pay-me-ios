//
//  NotificacionesViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import SWTableViewCell

class NotificacionesViewController: PMViewController, SWTableViewCellDelegate, UITextFieldDelegate {
    
    var notificaciones = [Notificacion]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        NotificationCenter.default.addObserver(self, selector: #selector(NotificacionesViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NotificacionesViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //self.txtPin.resignFirstResponder()
        return true
    }

}


extension NotificacionesViewController {
    
    override func initComponents() {
        notificaciones = [Notificacion(data: ["upc-logo","Universidad Karolina","Vto: 31 dic 2016","WLAN38472 F","pendiente","1,548.70"]),
                     Notificacion(data: ["entel-logo","Celular Juan","Vto: 05 ene 2017","982 366 740 F","cargo","1,548.70"]),
                     Notificacion(data: ["zeta-logo","Gas Casa Playa","Vto: 11 feb 2017","WLAN38472 F","verficacion",""]),
                     Notificacion(data: ["zeta-logo","Gas Casa Playa","Registro de Seguridad","WLAN38472 F","verficacion",""])
        
        ]
        
        //self.pinView.isHidden = true
        //spinView.backgroundColor = UIColor.appGrayColor()
    }
    
    
}

extension NotificacionesViewController: UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }*/
    
}

extension NotificacionesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificacionTableViewCell.identifier, for: indexPath) as! NotificacionTableViewCell
        
        cell.leftUtilityButtons = self.leftButton() as! [Any]
        cell.rightUtilityButtons = self.rigthButton() as! [Any]
        
        
        
        cell.delegate = self;
        cell.item = notificaciones[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? NotificacionTableViewCell
        
        //cell?.isExpanded = !cell!.isExpanded
        //cell?.pinViewHeightConstraint.constant = 100
        //tableView.beginUpdates()
        //tableView.endUpdates()
    }
}

//MARK : Extension to SWTableViewCellDelegate methods
extension NotificacionesViewController{
    //MARK : Pay Button
    func rigthButton() -> NSArray{
        let rigthUtilityButton : NSMutableArray = NSMutableArray()
        
        let payIcon = UIImage(named:"payButtonDefault")
        rigthUtilityButton.sw_addUtilityButton(with: UIColor.appBlueColor(), icon: payIcon)
        
        return rigthUtilityButton
    }
    
    //MARK : Delete Button
    func leftButton() -> NSArray{
        let leftUtilityButton : NSMutableArray = NSMutableArray()
        let deleteIcon = UIImage(named:"deleteButtonDefault")
        leftUtilityButton.sw_addUtilityButton(with: UIColor.appRedColor(), icon: deleteIcon)
        
        return leftUtilityButton
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerLeftUtilityButtonWith index: Int) {
        switch index {
        case 0:
            let cellIndexPath : IndexPath =  self.tableView.indexPath(for: cell)!
            notificaciones.remove(at: (cellIndexPath.row))
            self.tableView.deleteRows(at: [cellIndexPath], with: UITableViewRowAnimation.automatic)
            break
        default:break
        }
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerRightUtilityButtonWith index: Int) {
        switch index {
        case 0:
            //self.pinView.isHidden = false
            let cellIndexPath : IndexPath = self.tableView.indexPath(for: cell)!
            let cell = tableView.cellForRow(at: cellIndexPath) as? NotificacionTableViewCell
            cell?.pinViewHeightConstraint.constant = 100
            tableView.beginUpdates()
            tableView.endUpdates()
            print("accion pagar")
        default:break
        }
    }
    
}

//MARK : Extension to pinView related methods
extension NotificacionesViewController{
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(show: true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(show: false, notification: notification)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let changeInHeight = (keyboardFrame.height) * (show ? 1 : -1)
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            //self.pinViewBottomConstraint.constant += changeInHeight
        })
    }

}


