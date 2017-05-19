//
//  PMListaRecibosViewController.swift
//  Pay-me
//
//  Created by Cristian on 18/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMListaRecibosViewController: PMViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        
        let view = ReciboView.instanceFromNib()
        scrollView.addSubview(view)
    }
}

class ReciboView: UIView {
    
    class func instanceFromNib() -> ReciboView {
        return UINib(nibName: "PMListaRecibosView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil)[1] as! ReciboView
    }
}
