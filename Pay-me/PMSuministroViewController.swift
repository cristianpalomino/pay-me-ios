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
        suministroView.touchDelegate = self
        add(mainView: suministroView)
    }
    
    func callDebtConsult() {
        Request.debtConsult(completionHandler: {
            (response: ResponseHandlerDebtConsult) in
            
            Session.sharedInstance.current.addService.userName = response.name
            Session.sharedInstance.current.addService.services = response.services
        }, errorHandler: {
            error in
            print(error.localizedDescription.description.uppercased())
        }, finishHandler: {
            self.suministroView.hideLoadIndicator()
            self.toSegue(identifier: "toDetalleSuministro")
        })
    }
}

extension PMSuministroViewController: Touchable {
    
    func touch(params: Any?) {
        if let identifier = params as? String {
            Session.sharedInstance.current.addService.identifier = identifier
            suministroView.showLoadIndicator()
            callDebtConsult()
        }
    }
}


