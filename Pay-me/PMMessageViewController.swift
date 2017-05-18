//
//  PMServiceSavedViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 16/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMMessageViewController: UIViewController {

    typealias Information = (title: String, description: String)
    
    var information: Information?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescripcion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
    
    func prepare() {
        if let information = information {
            labelTitle.text = information.title
            labelDescripcion.text = information.description
        }
    }
}
