//
//  NotificacionTableViewCell.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NotificacionTableViewCell: UITableViewCell {

 
    
    var panRecognizer : UIPanGestureRecognizer!
    var panStartPoint = CGPoint.zero
    var startingRightLayoutConstraintConstant : CGFloat = 0.0
    @IBOutlet weak var contentViewRightConstraint : NSLayoutConstraint?
    @IBOutlet weak var contentViewLeftConstraint : NSLayoutConstraint?
    
    let kBounceValue :CGFloat = 20.0
    
    
    
    struct State {
        static let kPendiente   = "pendiente"
        static let kCargo       = "cargo"
        static let kVerficacion = "verficacion"
    };
    
    static let identifier = "notificacionCell"
    
    @IBAction func removeNotification(_ sender: Any) {
        
    }
    
    
    @IBAction func btnCustomizeAction(_ sender: Any) {
    }
    
    @IBOutlet weak var icon     : UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var message  : UILabel!
    @IBOutlet weak var code     : UILabel!
    @IBOutlet weak var estado   : UILabel!
    @IBOutlet weak var monto    : UILabel!
    @IBOutlet weak var btnAccionCustomizada: UIButton!
    @IBOutlet weak var btnEliminar: UIButton!
    @IBOutlet weak var myContentView: UIView!
    
    
    internal var item: Notificacion! {
        didSet {
            let image = UIImage(named: item.image)
            self.icon.image = image!.imageWithInsets(insetDimen: 12)
            self.name.text = item.name
            self.message.text = item.message
            self.code.text = item.code
            self.monto.text = item.monto
            
            self.defineState(state: item.etiqueta)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addStyles()
        self.panRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.panThisCell(reconizer:)))
        
        self.panRecognizer.delegate = self
        self.myContentView.addGestureRecognizer(self.panRecognizer)
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

    //MARK : Gesture Methods to Swipe
    
    func buttonTotalWidth() ->CGFloat {
        return self.frame.width - self.btnEliminar.frame.minX;
    }
    
    func resetContraintConstantsToZero(animated:Bool, notifyDelegateDidClose endEditing:Bool){
        if self.startingRightLayoutConstraintConstant == 0 && self.contentViewRightConstraint?.constant == 0 {
            return
        }
        self.contentViewRightConstraint?.constant = -kBounceValue
        self.contentViewLeftConstraint?.constant = kBounceValue
        self.updateConstraintsIfNeeded(animated: animated, completion: {(finished: Bool) -> Void in
            self.contentViewRightConstraint?.constant = 0
            self.contentViewLeftConstraint?.constant = 0
            self.updateConstraintsIfNeeded(animated: animated, completion: {(finished: Bool) -> Void in
                self.startingRightLayoutConstraintConstant = (self.contentViewRightConstraint?.constant)!
            })
        })
    }
    
    func setContraintToShowAllButton(animated:Bool, notifyDelegateDidOpen notifyDelegate:Bool){
        if(self.startingRightLayoutConstraintConstant == self.buttonTotalWidth() &&
            self.contentViewRightConstraint?.constant == self.buttonTotalWidth()){
            return
        }
        
        self.contentViewLeftConstraint?.constant =  -(self.buttonTotalWidth())-kBounceValue
        self.contentViewRightConstraint?.constant = self.buttonTotalWidth() + kBounceValue
        
        self.updateConstraintsIfNeeded(animated: animated, completion: {(finished: Bool) -> Void in
            
            self.contentViewLeftConstraint?.constant = -(self.buttonTotalWidth())
            self.contentViewRightConstraint?.constant = self.buttonTotalWidth()
            self.updateConstraintsIfNeeded(animated: animated, completion: {(finished: Bool) -> Void in
                
                self.startingRightLayoutConstraintConstant = (self.contentViewRightConstraint?.constant)!
            })
        })
    }
    
    
    func updateConstraintsIfNeeded(animated: Bool, completion: @escaping (_ finished: Bool) -> Void) {
        var duration: Float = 0
        if animated {
            duration = 0.1
        }
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: .curveEaseOut, animations: {() -> Void in
            self.layoutIfNeeded()
        }, completion: completion)
    }
    
    func panThisCell(reconizer : UIPanGestureRecognizer){
        switch reconizer.state {
        case UIGestureRecognizerState.began:
            self.panStartPoint = reconizer.translation(in: self.myContentView)
            self.startingRightLayoutConstraintConstant = (self.contentViewRightConstraint?.constant)!
            //print("Pan Began at %@", NSStringFromCGPoint(self.panStartPoint))
            break
            
        case UIGestureRecognizerState.changed:
            let currentPoint : CGPoint = reconizer.translation(in: self.myContentView)
            let deltaX : CGFloat = currentPoint.x - self.panStartPoint.x
            var panningLeft : Bool = false
            //print("Pan moved %f", deltaX)
            if(currentPoint.x < self.panStartPoint.x){
                panningLeft = true
            }
            
            if(self.startingRightLayoutConstraintConstant == 0){
                // La celda fue cerrada y es de nuevo abierta
                if(!panningLeft){
                    let constant : CGFloat = max(-deltaX, 0)
                    if(constant==0){
                        self.resetContraintConstantsToZero(animated: true, notifyDelegateDidClose: false)
                    }else{
                        self.contentViewRightConstraint?.constant =  constant
                    }
                }else{
                    let constant : CGFloat = min(-deltaX, buttonTotalWidth())
                    if (constant == self.buttonTotalWidth()) {
                        self.setContraintToShowAllButton(animated: true, notifyDelegateDidOpen: false)
                    }else{
                        self.contentViewRightConstraint?.constant =  constant
                    }
                }
            }else{
                //La celda fue parcialmente abierta
                let adjustment :CGFloat = self.startingRightLayoutConstraintConstant - deltaX
                if(!panningLeft){
                    
                    let constant : CGFloat =  max(adjustment, 0)
                    if(constant == 0){
                        self.resetContraintConstantsToZero(animated: true, notifyDelegateDidClose: false)
                        print("regresar constante")
                    }else{
                        self.contentViewRightConstraint?.constant = constant
                    }
                }else{
                    
                    let constant : CGFloat = min(adjustment, buttonTotalWidth())
                    if(constant == buttonTotalWidth()){
                        setContraintToShowAllButton(animated: true, notifyDelegateDidOpen: false)
                    }else{
                        self.contentViewRightConstraint?.constant =  constant
                    }
                }
            }
            self.contentViewLeftConstraint?.constant = -(self.contentViewRightConstraint?.constant)!
            
        case UIGestureRecognizerState.ended:
            if (self.startingRightLayoutConstraintConstant == 0) {
                let halfOfButton: CGFloat = self.btnEliminar.frame.width / 2
                if ((self.contentViewRightConstraint?.constant)! >= halfOfButton) {
                    self.setContraintToShowAllButton(animated: true, notifyDelegateDidOpen: true)
                    
                }else{
                    self.resetContraintConstantsToZero(animated: true, notifyDelegateDidClose: true)
                }
            }else {
                let buttonPlusHalfOfButton: CGFloat = self.btnEliminar.frame.width + (self.btnEliminar.frame.width / 2)
                if ((self.contentViewRightConstraint?.constant)! >= buttonPlusHalfOfButton) {
                    self.setContraintToShowAllButton(animated: true, notifyDelegateDidOpen: true)
                }else{
                    self.resetContraintConstantsToZero(animated: true, notifyDelegateDidClose: true)
                }
            }
            //print("Pan Ended")
            break
        case UIGestureRecognizerState.cancelled:
            if(self.startingRightLayoutConstraintConstant == 0){
                print("CANCELLED - constraint es igual a 0")
                self.resetContraintConstantsToZero(animated: true, notifyDelegateDidClose: true)
            }else{
                print("CANCELLED - constraint no es igual a 0")
                self.setContraintToShowAllButton(animated: true, notifyDelegateDidOpen: true)
            }
            //print("Pan Cancelled")
            break
        default:
            break
        }
        
    }
    
}

extension NotificacionTableViewCell {
    
    func defineState(state :String) {
        self.estado.text = state
        if state == State.kPendiente {
            self.estado.text = "  PENDIENTE DE PAGO  "
            self.estado.backgroundColor = UIColor.appRedColor()
        }
        else if state == State.kCargo {
            self.estado.text = "  CARGO AUTOMATICO  "
            self.estado.backgroundColor = UIColor.appGrayColor()
        }
        else if state == State.kVerficacion {
            self.estado.text = "  PENDIENTE DE VERIFICACIÓN  "
            self.estado.backgroundColor = UIColor.appGrayColor()
        }
    }
}

extension NotificacionTableViewCell {
    
    func addStyles() {
        self.icon.layer.cornerRadius = self.icon.frame.height * 0.5
        self.icon.layer.borderWidth = 1
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        
        self.estado.layer.masksToBounds = true
        self.estado.layer.cornerRadius = self.estado.frame.height * 0.5
    }
}

