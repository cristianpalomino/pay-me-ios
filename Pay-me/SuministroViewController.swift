//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Material
import AlamofireImage

class SuministroViewController: PMViewController {
    
    //Api
    weak var apiResponse    :ResponseConsultarDeudas?
    
    //Constraints
    @IBOutlet weak var mainViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var consultButtonBottomConstraint: NSLayoutConstraint!
    
    //Views
    @IBOutlet weak var viewOpenInfo         : UIView!
    @IBOutlet weak var viewInfo             : UIView!
    @IBOutlet weak var mainView             : UIView!
    @IBOutlet weak var txtIndentifier       : PMTextField!
    @IBOutlet weak var btnInfo              : UIButton!
    @IBOutlet weak var bigBannerView        : UIView!
    @IBOutlet weak var imageBigBannerView   : UIImageView!
    @IBOutlet weak var bannerView           : UIView!
    @IBOutlet weak var imageBannerView      : UIImageView!
    var errorView :PMErrorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initErrorView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == Constants.Storyboard.Segues.kDetailSuministro {
            let detalleViewController = segue.destination as! DetalleSuministroViewController
            if apiResponse != nil {
                detalleViewController.serviceIdentifier = self.txtIndentifier.text!
                detalleViewController.apiResponse = self.apiResponse
            }
        }
    }
}

extension SuministroViewController {
    
    override func initComponents() {
        self.txtIndentifier.setPMTheme()
        self.loadImages()
    }
}
