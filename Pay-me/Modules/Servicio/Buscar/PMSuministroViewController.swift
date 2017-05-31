//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import AlamofireImage

class PMSuministroViewController: PMViewController {
    
    var suministroView: PMSuministroView!
    
    
    override var headerTitle: String {
        guard let title = Session.shared.current.item?.empresa.shortName else {
            return "NONE"
        }
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        suministroView = PMSuministroView.instanceFromNib()
        suministroView.initUI()
        add(mainView: suministroView)
    }
    
    func callDebtConsult() {
        if let identifier = suministroView.identifier {
            PaymeService.debtConsult(identifier: identifier, completion: { response in
                switch response {
                case .success(let tuple):
                    self.responseConsult = tuple
                case .failure:
                    break
                }
                self.hideIndicator()
            })
        }
    }
    
    func consultService() {
        suministroView.showLoadIndicator()
        callDebtConsult()
    }
    
    func hideIndicator() {
        suministroView.hideLoadIndicator()
        toSegue(identifier: "toDetalleSuministro")
    }
    
    var responseConsult: (name: String, services: [Service])?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? PMDetalleSuministroViewController {
            dvc.identifier = suministroView.identifier
            dvc.responseConsult = responseConsult
        }
    }
}



