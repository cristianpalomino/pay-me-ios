//
//  PMItemCircle.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 31/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class PMItemCircle: UIView {
    @IBOutlet private var mview :UIView?
    var pmItemCircleDelegate :PMItemCircleDelegate?

    @IBOutlet var image             :UIImageView!
    @IBOutlet var title             :UILabel!
    @IBOutlet var button            :UIButton!
    
    var categoria :Categoria? {
        didSet {
            self.image.image = UIImage(named: categoria!.imageName)!
            self.title.text = categoria!.name
            addGestureEvent()
        }
    }
    
    public init(frame: CGRect, card :Card) {
        super.init(frame: frame)
        self.commonInit()
        self.initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        self.initView()
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    private func commonInit() {
        Bundle(for: PMItemCard.self).loadNibNamed("PMItemCircle", owner: self, options: nil)
        guard let content = mview else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}

extension PMItemCircle {
    
    func initView() {
        setTintIcon()
        addGestureEvent()
    }
    
    func setTintIcon() {
        self.image.image = image.image!.withRenderingMode(.alwaysTemplate)
        self.image.tintColor = UIColor.appBlueColor()
    }
    
    func addGestureEvent() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(recognizer:)))
        self.addGestureRecognizer(tap)
    }
    
    func tap(recognizer: UITapGestureRecognizer) {
        pmItemCircleDelegate?.tap(view: recognizer.view as! PMItemCircle)
    }
}

protocol PMItemCircleDelegate {
    
    func tap(view :PMItemCircle)
}
