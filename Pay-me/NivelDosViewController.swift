//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelDosViewController: PMViewController {

    @IBOutlet var topView           :PMItemCircle!
    @IBOutlet var rigthTopView      :PMItemCircle!
    @IBOutlet var leftTopView       :PMItemCircle!
    @IBOutlet var rigthMiddleView   :PMItemCircle!
    @IBOutlet var leftMiddleView    :PMItemCircle!
    @IBOutlet var rigthBottomView   :PMItemCircle!
    @IBOutlet var leftBottomView    :PMItemCircle!
    @IBOutlet var bottomView        :PMItemCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        whiteTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initComponents() {
        defineViews()
    }
}

extension NivelDosViewController {
    
    func defineViews() {
        let servicioGeneral = Session.sharedInstance.current.servicioGeneral!
        var views = [topView,
                     rigthTopView,
                     leftTopView,
                     rigthMiddleView,
                     leftMiddleView,
                     rigthBottomView,
                     leftBottomView,
                     bottomView]
        views.forEach{ $0?.pmItemCircleDelegate = self }
        
        if servicioGeneral.name == ServicesType.BASICOS.rawValue {
            views.remove(at: 0)?.categoria = servicioGeneral.categorias[0]
            views.forEach {  $0?.isHidden = true }
        } else if servicioGeneral.name == ServicesType.SEGUROS.rawValue {
            
        } else if servicioGeneral.name == ServicesType.EDUCACION.rawValue {
            views.remove(at: 0)?.categoria = servicioGeneral.categorias[0]
            views.forEach {  $0?.isHidden = true }
        } else if servicioGeneral.name == ServicesType.TRIBUTOS.rawValue {
            
        }
    }
}

extension NivelDosViewController : PMItemCircleDelegate {

    func tap(view: PMItemCircle) {
        Session.sharedInstance.current.categoria = view.categoria
        performSegue(withIdentifier: Constants.Storyboard.Segues.kToEmpresas, sender: nil)
    }
}

