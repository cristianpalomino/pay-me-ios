//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelDosViewController: PMViewController {

    @IBOutlet var topIcon           :UIImageView!
    @IBOutlet var rigthTopIcon      :UIImageView!
    @IBOutlet var leftTopIcon       :UIImageView!
    @IBOutlet var rigthMiddleIcon   :UIImageView!
    @IBOutlet var leftMiddleIcon    :UIImageView!
    @IBOutlet var rigthBottomIcon   :UIImageView!
    @IBOutlet var leftBottomIcon    :UIImageView!
    @IBOutlet var bottomIcon        :UIImageView!
    
    @IBOutlet var topView           :UIView!
    @IBOutlet var rigthTopView      :UIView!
    @IBOutlet var leftTopView       :UIView!
    @IBOutlet var rigthMiddleView   :UIView!
    @IBOutlet var leftMiddleView    :UIView!
    @IBOutlet var rigthBottomView   :UIView!
    @IBOutlet var leftBottomView    :UIView!
    @IBOutlet var bottomView        :UIView!
    
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
        setTintIcons()
    }
}

extension NivelDosViewController {
    
    func defineViews() {
        let servicioGeneral = Session.sharedInstance.current.servicioGeneral!
        var views = [topView, rigthTopView, leftTopView, rigthMiddleView, leftMiddleView, rigthBottomView, leftBottomView, bottomView]
        if servicioGeneral.name == Services.BASICOS.rawValue {
            views.remove(at: 0)
            views.forEach {  $0?.isHidden = true }
        } else if servicioGeneral.name == Services.SEGUROS.rawValue {
            
        } else if servicioGeneral.name == Services.EDUCACION.rawValue {
            views.remove(at: 0)
            views.forEach {  $0?.isHidden = true }
        } else if servicioGeneral.name == Services.TRIBUTOS.rawValue {
            
        }
    }
}

extension NivelDosViewController {

    @IBAction func tapTop() {
        
    }
    
    @IBAction func tapRigthTop() {
        
    }
    
    @IBAction func tapLeftTop() {
        
    }
    
    @IBAction func tapRigthMiddle() {
        
    }
    
    @IBAction func tapLeftMiddle() {
        
    }
    
    @IBAction func tapRigthBottom() {
        
    }
    
    @IBAction func tapLeftBottom() {
        
    }
    
    @IBAction func tapBottom() {
        
    }
}

extension NivelDosViewController {
    
    func setTintIcons() {
        let imageviews = [topIcon,rigthTopIcon,leftTopIcon,rigthMiddleIcon,leftMiddleIcon,rigthBottomIcon,leftBottomIcon,bottomIcon]
        for item in imageviews {
            item?.image = item?.image!.withRenderingMode(.alwaysTemplate)
            item?.tintColor = UIColor.appBlueColor()
        }
    }
}
