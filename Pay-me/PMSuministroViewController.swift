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
        guard let title = Session.sharedInstance.current.item?.empresa.shortName else {
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
            Request.debtConsult(identifier: identifier, completionHandler: { response in
                
                self.responseConsult = response
                self.hideIndicator()
            }, errorHandler: { error in
                
                print(error.localizedDescription)
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
    
    var responseConsult: ResponseHandlerDebtConsult?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? PMDetalleSuministroViewController {
            dvc.identifier = suministroView.identifier
            dvc.responseConsult = responseConsult
        }
    }
}



