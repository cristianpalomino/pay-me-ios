//
//  PagoAutomaticoViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 12/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PagoAutomaticoViewController: PMViewController {
    
    let cards = [Card(type: .INVALID, image: "master-card-logo"),
                 Card(type: .VALID  , image: "visa-logo")]

    @IBOutlet weak var stchPagoAutomatico: UISwitch!
    @IBOutlet weak var viewPeriodicidad: UIView!
    @IBOutlet weak var viewTituloInformacionPago: UIView!
    @IBOutlet weak var viewFechaPago: UIView!
    @IBOutlet weak var viewFechaInicioPago: UIView!
    @IBOutlet weak var viewMetodoPago: UIView!
    @IBOutlet weak var viewDiasPagoAutomatico: UIView!
    @IBOutlet weak var scrollCardView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func initComponents() {
        addStyles()
        updateViewIsHiddenState(state: true)
        initCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initCards() {
        for i in 0...1 {
         let x = self.view.frame.width * CGFloat(i)
         let y = CGFloat(0)
         let width = self.view.frame.width
         let heigth = self.view.frame.height * 0.11
         let frame = CGRect(x: x, y: y, width: width, height: heigth)
         let card = PMItemCard(frame: frame, card: cards[i])
         self.scrollCardView.addSubview(card)
         }
         self.scrollCardView.contentSize = CGSize(width: Int(self.view.frame.width * 2), height: Int(self.scrollCardView.frame.height))
    }
    
    @IBAction func cambiarEstadoPagoAutomatico(_ sender: Any) {
        var hide :Bool =  true
        if(stchPagoAutomatico.isOn){
            hide = false
            updateViewIsHiddenState(state: hide)
        }else{
            hide =  true
            updateViewIsHiddenState(state: hide)
            
        }
    }
    
    func updateViewIsHiddenState(state : Bool){
        viewPeriodicidad.isHidden=state
        viewTituloInformacionPago.isHidden = state
        viewFechaPago.isHidden = state
        viewFechaInicioPago.isHidden = state
        viewMetodoPago.isHidden = state
        scrollCardView.isHidden = state
    }
    
    func addStyles(){
        self.viewDiasPagoAutomatico.layer.masksToBounds = true
        self.viewDiasPagoAutomatico.layer.cornerRadius = self.viewDiasPagoAutomatico.frame.height * 0.5
    }
    
    
}
