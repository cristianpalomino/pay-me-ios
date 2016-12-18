//
//  SuministroViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Material

class SuministroViewController: PMViewController {
    @IBOutlet weak var bigBannerHeigth: NSLayoutConstraint!

    @IBOutlet weak var txtIndentifier: TextField!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var bigBannerView: UIView!
    @IBOutlet weak var imageBigBannerView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var imageBannerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
        initComponents()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SuministroViewController {
    
    func initComponents() {
        self.bannerView.layer.borderColor = UIColor.darkGray.cgColor
        self.bannerView.backgroundColor = UIColor.lightGray
        self.bannerView.layer.borderWidth = 1
        
        self.bigBannerView.layer.borderColor = UIColor.darkGray.cgColor
        self.bigBannerView.backgroundColor = UIColor.lightGray
        self.bigBannerView.layer.borderWidth = 1
    }
}

extension SuministroViewController {
    
    @IBAction func tapConsultar() {
        
    }
    
    @IBAction func tapInfo() {
        
    }
}

extension SuministroViewController {
    
    func hiddeBigBanner() {
        print(self.bigBannerHeigth.constant)
        self.bigBannerHeigth.multiplier = 0.0001
        self.bigBannerView.layoutIfNeeded()
    }
    
    override func keyboardDidShow() {
        hiddeBigBanner()
    }
    
    override func keyboardDidHide() {
        print("keyboardDidHide")
    }
}
