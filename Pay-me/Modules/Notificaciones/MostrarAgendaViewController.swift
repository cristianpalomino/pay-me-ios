//
//  MostrarAgendaViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class MostrarAgendaViewController: PMViewController {

    @IBOutlet weak var stchMostrarEnAgenda: UISwitch!
    @IBOutlet weak var viewTituloDeseoMostrarEnAgenda: UIView!
    
    @IBOutlet weak var viewEmisionPago: UIView!
    
    @IBOutlet weak var viewFechaVencimiento: UIView!
    @IBOutlet weak var viewFechaPago: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initComponents() {
        updateViewIsHiddenState(state: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cambiarEstadoMostrarEnAgenda(_ sender: Any) {
        var hide : Bool = true
        if(stchMostrarEnAgenda.isOn){
            hide =  false
            updateViewIsHiddenState(state: hide)
        }else{
            hide = true
            updateViewIsHiddenState(state: hide)
        }
    }
    
    
    func updateViewIsHiddenState(state : Bool){
        viewTituloDeseoMostrarEnAgenda.isHidden=state
        viewEmisionPago.isHidden = state
        viewFechaVencimiento.isHidden = state
        viewFechaVencimiento.isHidden = state
        viewFechaPago.isHidden = state
    }

 

}
