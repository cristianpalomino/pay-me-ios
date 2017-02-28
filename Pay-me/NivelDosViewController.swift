//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelDosViewController: PMViewController {
    
    @IBOutlet weak var topView           :PMItemCircle!
    @IBOutlet weak var rigthTopView      :PMItemCircle!
    @IBOutlet weak var leftTopView       :PMItemCircle!
    @IBOutlet weak var rigthMiddleView   :PMItemCircle!
    @IBOutlet weak var leftMiddleView    :PMItemCircle!
    @IBOutlet weak var rigthBottomView   :PMItemCircle!
    @IBOutlet weak var leftBottomView    :PMItemCircle!
    @IBOutlet weak var bottomView        :PMItemCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        whiteTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func initComponents() {
        defineViews()
    }
}

extension NivelDosViewController {
    
    func defineViews() {
        let servicioGeneral = Session.sharedInstance.current.servicioGeneral!
        
        self.titleLabel.text = servicioGeneral.name
        
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

