//
//  RecibosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class RecibosViewController: PMViewController {
    let cards = [Card(type: .INVALID, image: "master-card-logo"),
                 Card(type: .VALID  , image: "visa-logo")]
    
    
    @IBOutlet var btnPay                :PMButton!
    @IBOutlet var bannerView            :UIView!
    @IBOutlet var dataView              :UIView!
    @IBOutlet var txtEmision            :PMTextField!
    @IBOutlet var txtVencimiento        :PMTextField!
    @IBOutlet var scrollCardView        :UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension RecibosViewController {
    
    override func initComponents() {
        txtEmision.setPMTheme()
        txtVencimiento.setPMTheme()
        initFlow()
    }
    
    func initFlow() {
        let type = Session.sharedInstance.flowType
        if type == .FIRST_TIME {
            scrollCardView.isHidden = true
        } else {
            scrollCardView.isHidden = false
            initCards()
        }
    }
    
    func initCards() {
        for i in 0...1 {
            let x = self.view.frame.width * CGFloat(i)
            let y = CGFloat(0)
            let width = self.view.frame.width
            let heigth = self.view.frame.height * 0.11
            let frame = CGRect(x: x, y: y, width: width, height: heigth)
            let card = PMItemCard(frame: frame, card: cards[i])
            self.scrollCardView.addSubview(card)
        }
        self.scrollCardView.contentSize = CGSize(width: Int(self.view.frame.width * 2), height: Int(self.scrollCardView.frame.height))
    }
}

extension RecibosViewController {
    
    @IBAction func tapPagar() {
        let type = Session.sharedInstance.flowType
        if type == .FIRST_TIME {
            payFlowFirstTime()
        } else {
            payFlowSecondTime()
        }
    }
    
    func payFlowFirstTime() {
        self.performSegue(withIdentifier: "kFirstTime", sender: nil)
    }
    
    func payFlowSecondTime() {
        self.performSegue(withIdentifier: "kSecondTime", sender: nil)
    }
}
