//
//  ConfiguracionNotificacionesViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class ConfiguracionNotificacionesViewController: PMViewController {

    @IBOutlet weak var stchRecibirNotificaciones: UISwitch!
    @IBOutlet weak var viewTituloDeseoRecibirNotificaciones: UIView!
    
    @IBOutlet weak var viewEmisionRecibo: UIView!
    @IBOutlet weak var viewFechaVencimiento: UIView!
    @IBOutlet weak var viewConfirmacionPago: UIView!
    @IBOutlet weak var viewRecordatorio: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initComponents() {
        //actualizar con sesion?
        updateViewIsHiddenState(state: true)
    }
    
    @IBAction func recibirNotificaciones(_ sender: Any) {
        var hide : Bool = true
        if stchRecibirNotificaciones.isOn{
            hide = false
            updateViewIsHiddenState(state: hide)
        }else{
            hide =  true
            updateViewIsHiddenState(state: hide)
        }
    }
    
    func updateViewIsHiddenState(state : Bool){
        viewTituloDeseoRecibirNotificaciones.isHidden=state
        viewEmisionRecibo.isHidden = state
        viewFechaVencimiento.isHidden = state
        viewConfirmacionPago.isHidden = state
        viewRecordatorio.isHidden = state
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
