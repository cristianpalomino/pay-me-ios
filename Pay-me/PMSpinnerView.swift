//
//  PMSpinnerView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMSpinnerView: UIView {
    
    var items: Items!
    var spinnerType: SpinnerType = .point
    var delegate: Touchable?
    var shouldSetupFrame = true
    
    var centerView: PMCenterView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    func prepare() {
        centerView = PMCenterView(frame: .zero) 
        addSubview(centerView)
    }
    
    func update() {
        if shouldSetupFrame {
            prepareCenterView()
            defineDistribution()
            shouldSetupFrame = false
        }
    }
    
    func prepareCenterView() {
        centerView.frame = frameCenterView
        centerView.center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
    }
    
    func defineDistribution() {
        switch spinnerType {
        case .square:
            Square()
            break
        case .point:
            Point()
            break
        }
    }
    
    func Square() {
        for (index, item) in items.enumerated() {
            let item = PMItemView(item: item)
            item.tag = index
            item.position = pSquare[index]
            item.frame.size = CGSize(width: itemSizeSide, height: itemSizeSide)
            addSubview(item)
            
            let touch = UITapGestureRecognizer(target: self, action: #selector(self.touchItem(sender:)))
            item.addGestureRecognizer(touch)
        }
    }
    
    func Point() {
        for (index, item) in items.enumerated() {
            let item = PMItemView(item: item)
            item.tag = index
            item.position = pPoint[index]
            item.frame.size = CGSize(width: itemSizeSide, height: itemSizeSide)
            addSubview(item)
            item.center.x = center.x
            
            let touch = UITapGestureRecognizer(target: self, action: #selector(self.touchItem(sender:)))
            item.addGestureRecognizer(touch)
        }
    }
    
    func touchItem(sender: UITapGestureRecognizer) {
        delegate?.touch(params: sender.view!)
    }
    
    override func addCircleBorder() {
        layer.cornerRadius = bounds.height * 0.5
    }
    
    let margin: CGFloat = 15
    
    var itemSizeSide: CGFloat {
        return bounds.width * (70 / bounds.width)
    }
    
    var totalMarginAndSide: CGFloat {
        return margin + itemSizeSide
    }
    
    typealias Points = [CGPoint]
    var pSquare: Points {
        let centerFrame = centerView.frame
        return [CGPoint(x: centerFrame.origin.x - itemSizeSide, y: centerFrame.origin.y - itemSizeSide),
                CGPoint(x: centerFrame.width + centerFrame.origin.x, y: centerFrame.origin.y - itemSizeSide),
                CGPoint(x: centerFrame.origin.x - itemSizeSide, y: centerFrame.height + centerFrame.origin.y),
                CGPoint(x: centerFrame.width + centerFrame.origin.x, y: centerFrame.height + centerFrame.origin.y)]
    }
    
    var pPoint: Points {
        let centerFrame = centerView.frame
        return [CGPoint(x: 0, y: centerFrame.origin.y - (centerFrame.width + margin))]
    }
    
    var frameCenterView: CGRect {
        let side = bounds.width * (94 / bounds.width)
        return CGRect(x: 0, y: 0, width: side, height: side)
    }
}

typealias Items = [(String, UIImage)]

enum SpinnerType: Int {
    
    case square = 4
    case point = 1
}
