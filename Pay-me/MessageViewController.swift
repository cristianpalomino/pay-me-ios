
//
//  MessageViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 28/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class MessageViewController: PMMessageViewController {
    let cards = [Card(type: .INVALID, image: "master-card-logo"),
                 Card(type: .VALID  , image: "visa-logo"),
                 Card(type: .ADD    , image: "ic-close-circle")]
    var currentCard :Card!
    
    @IBOutlet var iconMessage           :UIImageView!
    @IBOutlet var scrollCards           :UIScrollView!
    @IBOutlet var titleMessage          :UILabel!
    @IBOutlet var descriptionMessage    :UILabel!
    @IBOutlet var instructionMessage    :UILabel!
    @IBOutlet var btnPay                :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineMessage()
        currentCard = cards.first!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MessageViewController {
    
    @IBAction func tapPay() {
        if currentCard.type == .ADD {
            
        } else if currentCard.type == .VALID ||
            currentCard.type == .DEFAULT {
            self.dismiss(animated: true, completion: {
                self.showMessage(type: .SUCCESS_PAY)
            })
        }
    }
}

extension MessageViewController {
    
    override func initComponents() {
        addTouchListener()
        addBorder()
        
        for i in 0...2 {
            let x = self.view.frame.width * CGFloat(i)
            let y = CGFloat(0)
            let width = self.view.frame.width
            let heigth = self.view.frame.height * 0.11
            let frame = CGRect(x: x, y: y, width: width, height: heigth)
            let card = PMItemCard(frame: frame, card: cards[i])
            self.scrollCards.addSubview(card)
        }
        
        self.scrollCards.contentSize = CGSize(width: Int(self.view.frame.width * 3), height: Int(self.scrollCards.frame.height))
    }
}

extension MessageViewController : UIScrollViewDelegate {
 
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        if cards[index].type == .ADD {
            self.btnPay.setTitle("Siguiente", for: .normal)
            self.btnPay.isHidden = false
        } else if cards[index].type == .VALID ||
            cards[index].type == .DEFAULT {
            self.btnPay.setTitle("Pagar Recibo", for: .normal)
            self.btnPay.isHidden = false
        } else if cards[index].type == .INVALID {
            self.btnPay.isHidden = true
        }
    }
}

extension MessageViewController {
    
    func addBorder() {
        self.scrollCards.layer.borderWidth = 0.5
        self.scrollCards.layer.borderColor = UIColor.appGrayColor().cgColor
    }
    
    func defineMessage() {
        switch Session.sharedInstance.messageType {
        case .SUCCESS_PAY:
            defineSuccessPay()
            break
        case .NOT_AUTORIZED:
            defineNotAutorized()
            break
        case .INVALID_CARD:
            defineNotValid()
            break
        case .SERVICE_SAVED:
            defineSavedService()
            break
        }
    }
    
    func defineNotAutorized() {
        self.iconMessage.image = UIImage(named: "icon-center-gradient")
        self.titleMessage.text = "!Pago no autorizado!"
        self.btnPay.isHidden = true
    }
    
    func defineNotValid() {
        self.iconMessage.image = UIImage(named: "icon-center-gradient")
        self.titleMessage.text = "!Tarjeta de crédito no válida!"
        self.btnPay.isHidden = true
    }
    
    func defineSavedService() {
        self.iconMessage.image = UIImage(named: "icon-check-center-gradient")
        self.titleMessage.text = "!Servicio guardado!"
        self.scrollCards.isHidden = true
        self.instructionMessage.isHidden = true
        self.btnPay.isHidden = true
    }
    
    func defineSuccessPay() {
        self.iconMessage.image = UIImage(named: "icon-check-center-gradient")
        self.titleMessage.text = "!Pago éxitoso!"
        self.scrollCards.isHidden = true
        self.instructionMessage.isHidden = true
        self.btnPay.isHidden = true
    }
}
