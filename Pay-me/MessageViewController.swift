
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
    var withCard   :Bool = false

    var currentCard :Card!
    
    @IBOutlet var cBotButtom            :NSLayoutConstraint!
    @IBOutlet var cTopView              :NSLayoutConstraint!
    
    @IBOutlet var txtNumeroTarjeta      :PMTextField!
    @IBOutlet var txtMes                :PMTextField!
    @IBOutlet var txtAnio               :PMTextField!
    @IBOutlet var txtCvv                :UITextField!
    
    @IBOutlet var frontCardView         :UIView!
    @IBOutlet var backCardView          :UIView!
    @IBOutlet var cardView              :UIView!
    
    @IBOutlet var iconView              :UIView!
    @IBOutlet var iconMessage           :UIImageView!
    @IBOutlet var scrollCards           :UIScrollView!
    @IBOutlet var titleMessage          :UILabel!
    @IBOutlet var descriptionMessage    :UILabel!
    @IBOutlet var instructionMessage    :UILabel!
//    @IBOutlet var btnPay                :PMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardObservers()
        defineMessage()
        currentCard = cards.first!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MessageViewController {
    
    @IBAction func tapPay() {
        if currentCard.type == .ADD {
            if withCard {
                self.dismiss(animated: true, completion: {
                    
                })
            } else {
                self.titleMessage.text = "!Adiciona una nueva tarjeta!"
                self.instructionMessage.isHidden = true
                self.scrollCards.isHidden = true
                self.cardView.isHidden = false
//                self.btnPay.setTitle("Pagar Recibo", for: .normal)
                self.withCard = true
            }
        } else if currentCard.type == .VALID ||
            currentCard.type == .DEFAULT {
            self.dismiss(animated: true, completion: {
//                self.showMessage(type: .SUCCESS_PAY)
            })
        }
    }
    
    @IBAction func tapFlip() {
        self.frontCardView.isHidden = true
        self.backCardView.isHidden = false
        self.txtCvv.becomeFirstResponder()
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
        self.currentCard = cards[index]
        
        if cards[index].type == .ADD {
//            self.btnPay.setTitle("Siguiente", for: .normal)
//            self.btnPay.isHidden = false
        } else if cards[index].type == .VALID ||
            cards[index].type == .DEFAULT {
//            self.btnPay.setTitle("Pagar Recibo", for: .normal)
//            self.btnPay.isHidden = false
        } else if cards[index].type == .INVALID {
//            self.btnPay.isHidden = true
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
//        self.btnPay.isHidden = true
    }
    
    func defineNotValid() {
        self.iconMessage.image = UIImage(named: "icon-center-gradient")
        self.titleMessage.text = "!Tarjeta de crédito no válida!"
//        self.btnPay.isHidden = true
    }
    
    func defineSavedService() {
        self.iconMessage.image = UIImage(named: "icon-check-center-gradient")
        self.titleMessage.text = "!Servicio guardado!"
        self.scrollCards.isHidden = true
        self.instructionMessage.isHidden = true
//        self.btnPay.isHidden = true
    }
    
    func defineSuccessPay() {
        self.iconMessage.image = UIImage(named: "icon-check-center-gradient")
        self.titleMessage.text = "!Pago éxitoso!"
        self.scrollCards.isHidden = true
        self.instructionMessage.isHidden = true
//        self.btnPay.isHidden = true
    }
}

extension MessageViewController {
    
    override func keyboardDidShow(notification: NSNotification) {
        super.keyboardDidShow(notification: notification)
        
//        if self.cBotButtom.constant == 0 {
//            self.cTopView.constant = -(self.cardView.frame.origin.y - SizesUtil.statusNavHeight(self) - 8)
//            self.cBotButtom.constant = keyboardHeigth
//            UIView.animate(withDuration: 0.15, animations: {
//                self.iconView.isHidden = true
//                self.titleMessage.isHidden = true
//                self.descriptionMessage.isHidden = true
//                self.instructionMessage.isHidden = true
//                self.view.layoutIfNeeded()
//            }, completion: {
//                (finished :Bool) -> Void in
//            })
//        }
    }
    
    override func keyboardDidHide() {
        
//        if self.cBotButtom.constant == 0 {
//            self.cTopView.constant = 0
//            self.cBotButtom.constant = 0
//            UIView.animate(withDuration: 0.15, animations: {
//                self.iconView.isHidden = false
//                self.titleMessage.isHidden = false
//                self.descriptionMessage.isHidden = false
//                self.instructionMessage.isHidden = false
//                self.view.layoutIfNeeded()
//            }, completion: {
//                (finished :Bool) -> Void in
//            })
//        }
    }
}
