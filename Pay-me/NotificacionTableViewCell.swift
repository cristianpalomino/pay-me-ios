//
//  NotificacionTableViewCell.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
//import SWTableViewCell

protocol NotificacionTableViewCellDelegate {
    func cellDidOpen(_ cell: UITableViewCell)
    func cellDidClose(_ cell: UITableViewCell)
}
class NotificacionTableViewCell: UITableViewCell {
    
    
    var isExpanded : Bool = false
    var delegate: NotificacionTableViewCellDelegate?
    
    struct State {
        static let kPendiente   = "pendiente"
        static let kCargo       = "cargo"
        static let kVerficacion = "verficacion"
    };
    
    static let identifier = "notificacionCell"
    let kBounce : CGFloat = 20.0
    
    @IBOutlet weak var icon     : UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var message  : UILabel!
    @IBOutlet weak var code     : UILabel!
    @IBOutlet weak var estado   : UILabel!
    @IBOutlet weak var monto    : UILabel!
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var contentViewToButtons: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var pinViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var myContentViewRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var myContentViewLeftConstraint: NSLayoutConstraint!
    var panRecognizer : UIPanGestureRecognizer!
    var panStartPoint : CGPoint = CGPoint.zero
    var startingRightLayoutConstraintConstant : CGFloat = 0.0
    
    
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
        self.panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panThisCell))
        self.panRecognizer.delegate = self
        self.myContentView.addGestureRecognizer(self.panRecognizer)
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func openCell(){
        self.setConstraintsToShowAllButtons(animated: false, notifyDelegateDidOpen: false)
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
    
    func panThisCell(recognizer : UIPanGestureRecognizer){
        switch recognizer.state {
        case UIGestureRecognizerState.began:
            self.panStartPoint = recognizer.translation(in: self.myContentView)
            self.startingRightLayoutConstraintConstant = self.myContentViewRightConstraint.constant
            break
        case UIGestureRecognizerState.changed:
            let currentPoint : CGPoint = recognizer.translation(in: self.myContentView)
            let deltaX : CGFloat = currentPoint.x  - self.panStartPoint.x
            var panningLeft : Bool = false
            if(currentPoint.x < self.panStartPoint.x){
                panningLeft = true
            }
            
            if(self.startingRightLayoutConstraintConstant == 0 ){
                if(!panningLeft){
                    let constant : CGFloat = max(deltaX, 0)
                    if(constant == 0 ){
                        self.resetConstraintConstantToZero(animated: true, notifyDelegateDidClose: false)
                    }else{
                        self.myContentViewRightConstraint.constant = constant
                    }
                    
                }else{
                    let constant : CGFloat = min(-deltaX, self.buttonTotalWidth())
                    if(constant == self.buttonTotalWidth()){
                        self.setConstraintsToShowAllButtons(animated: true, notifyDelegateDidOpen: false)
                        
                    }else{
                        self.myContentViewRightConstraint.constant = constant
                    }
                }
            }else{
                let adjustment : CGFloat = self.startingRightLayoutConstraintConstant - deltaX
                if(!panningLeft){
                    let constant :CGFloat = max(adjustment, 0)
                    if(constant == 0){
                        self.resetConstraintConstantToZero(animated: true, notifyDelegateDidClose: false)
                    }else{
                        self.myContentViewRightConstraint.constant = constant
                    }
                }else{
                    let constant :CGFloat = min(adjustment, self.buttonTotalWidth())
                    if(constant == self.buttonTotalWidth()){
                        self.setConstraintsToShowAllButtons(animated: true, notifyDelegateDidOpen: false)
                    }else{
                        self.myContentViewRightConstraint.constant = constant
                    }
                }
            }
            self.myContentViewLeftConstraint.constant = -self.myContentViewRightConstraint.constant
            break
        case UIGestureRecognizerState.ended:
            if(self.startingRightLayoutConstraintConstant == 0){
                let halfOfButtonOne = self.payButton.frame.width / 2
                
                if(self.myContentViewRightConstraint.constant >= halfOfButtonOne){
                    self.setConstraintsToShowAllButtons(animated: true, notifyDelegateDidOpen: true)
                    
                    NSLog("El constraint derecho es mayor a la mitad del ancho del boton de pago")
                }else{
                    self.resetConstraintConstantToZero(animated: true, notifyDelegateDidClose: true)
                    NSLog("Cancelar deslizamiento y regresar a cero")
                }
            }else{
                let buttoOnePlusHalfOfButton2 : CGFloat = self.payButton.frame.width + (self.deleteButton.frame.width / 2)
                
                if(self.myContentViewRightConstraint.constant >= buttoOnePlusHalfOfButton2){
                    self.setConstraintsToShowAllButtons(animated: true, notifyDelegateDidOpen: true)
                }else{
                    self.resetConstraintConstantToZero(animated: true, notifyDelegateDidClose: true)
                    NSLog("Cancelar deslizamiento y regresar a cero 2")
                }
            }
            break
        case UIGestureRecognizerState.cancelled:
            if(self.startingRightLayoutConstraintConstant == 0){
                self.resetConstraintConstantToZero(animated: true, notifyDelegateDidClose: true)
            }else{
                self.setConstraintsToShowAllButtons(animated: true, notifyDelegateDidOpen: true)
            }
            break
        default:
            break
        }
        
    }
    
    func buttonTotalWidth()->CGFloat {
        return self.frame.width - self.deleteButton.frame.minX
    }
    
    func resetConstraintConstantToZero(animated :Bool, notifyDelegateDidClose notifyDelegate: Bool){
        if (notifyDelegate) {
            self.delegate?.cellDidClose(self)
        }
        if(self.startingRightLayoutConstraintConstant == 0 && self.myContentViewRightConstraint.constant == 0){
            return;
        }
        
        self.myContentViewRightConstraint.constant = -kBounce
        self.myContentViewLeftConstraint.constant = kBounce
        
        self.updateConstraintIfNeeded(animated: animated , completion: {(_ finished : Bool)-> Void in
            
            self.myContentViewRightConstraint.constant = 0
            self.myContentViewLeftConstraint.constant = 0
            
            self.updateConstraintIfNeeded(animated: animated, completion: { (_ finished : Bool)-> Void in
                self.startingRightLayoutConstraintConstant = self.myContentViewRightConstraint.constant
            })
        })
    
    }
    
    func setConstraintsToShowAllButtons(animated: Bool, notifyDelegateDidOpen notifyDelegate: Bool){
        if (notifyDelegate) {
            self.delegate?.cellDidOpen(self)
        }
        
        if(self.startingRightLayoutConstraintConstant == self.buttonTotalWidth() && self.myContentViewRightConstraint.constant == self.buttonTotalWidth()){
            return
        }
        self.myContentViewLeftConstraint.constant = (-self.buttonTotalWidth()) - self.kBounce
        
        self.myContentViewRightConstraint.constant = self.buttonTotalWidth() + self.kBounce
        
        self.updateConstraintIfNeeded(animated: animated , completion: {(_ finished :Bool) ->Void in
            self.myContentViewLeftConstraint.constant = -self.buttonTotalWidth()
            self.myContentViewRightConstraint.constant = -self.buttonTotalWidth()
            
            self.updateConstraintIfNeeded(animated: animated, completion: {(_ finished :Bool) -> Void in
                self.startingRightLayoutConstraintConstant = self.myContentViewRightConstraint.constant
            })
        
        })
    }
    
    func updateConstraintIfNeeded(animated : Bool, completion : @escaping(_ finished: Bool)->Void){
        var duration : Float = 0
        if(animated){
            duration = 0.1
        }
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {() -> Void in self.layoutIfNeeded()}, completion: completion)
    
    }
    
    func gestureRecognizer(gestureRecognizer : UIGestureRecognizer, shouldRecognizeSimultaenouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        return true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.resetConstraintConstantToZero(animated: false, notifyDelegateDidClose: false)
    }
    
}





