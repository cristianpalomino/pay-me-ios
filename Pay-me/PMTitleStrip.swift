//
//  PMTitleStrip.swift
//  PMTitleStrip
//
//  Created by Alignet Desarrollo on 25/04/17.
//  Copyright © 2017 Alignet Desarrollo. All rights reserved.
//

import UIKit

@IBDesignable
class PMTitleStrip: UIView {
    
    var delegate: PMTitleStripDelegate?
    
    var scrollView: UIScrollView!
    var viewStrip: UIView!
    
    var titles = [(title: String,color: UIColor)]()
    var buttons = [PMTitle]()
    
    init(frame: CGRect, titles: [(title: String,color: UIColor)]) {
        super.init(frame: frame)
        self.titles = titles
        self.prepare()
//        
//        //
//        self.addBorder(toSide: .bottom, withColor: UIColor.lightGray, andThickness: 1)
//        
//        //
//        let viewStripHeigth = self.frame.height * 0.75
//        
//        //
//        let frameViewStrip = CGRect(x: 10, y: 0, width: 0, height: 0)
//        self.viewStrip = UIView(frame: frameViewStrip)
//        self.scrollView.addSubview(self.viewStrip)
//        
//        //
//        let widthMiddleSize = self.frame.width * 0.5
//        var origin = widthMiddleSize
//        
//        //
//        for item in self.titles {
//            
//            let button = PMTitle(frame: .zero, title: item.title, color: item.color, focus: false)
//            button.sizeToFit()
//            
//            button.addTarget(self, action: #selector(self.action(sender:)), for: .touchUpInside)
//            
//            button.frame.origin.x = origin
//            button.frame.size = CGSize(width: button.frame.width + 50, height: viewStripHeigth * 0.8)
//            button.center.y = self.center.y
//            
//            button.layer.cornerRadius = button.frame.height * 0.5
//            
//            debugPrint(button.frame)
//            
//            self.scrollView.addSubview(button)
//            self.buttons.append(button)
//            
//            origin = origin + button.frame.width
//        }
//        
//        focusDefault()
//        
//        let size = origin + widthMiddleSize
//        
//        self.viewStrip.frame.size = CGSize(width: size, height: viewStripHeigth)
//        self.viewStrip.center.y = self.center.y
//        
//        self.scrollView.contentSize = CGSize(width: size + 20, height: viewStripHeigth)
//        
//        //
//        self.viewStrip.layer.borderColor = UIColor.lightGray.cgColor
//        self.viewStrip.layer.borderWidth = 1
//        self.viewStrip.layer.cornerRadius = viewStripHeigth * 0.5
    }
    
    func focusDefault() {
        buttons[0].isFocus(focus: true)
    }
    
    func action(sender: PMTitle) {
        sender.isFocus(focus: true)
        let notFocus = buttons.filter { $0 != sender }
        notFocus.forEach { $0.isFocus(focus: false) }
        delegate?.selectTitle()
    }
    
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
    }
    
    private func prepare() {
        scrollView = UIScrollView(frame: self.frame)
        
        backgroundColor = UIColor.white
        
        let bottomBorder = CALayer()
        layer.backgroundColor = UIColor.appGrayBorderColor().cgColor
        layer.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: 1)
        layer.addSublayer(bottomBorder)
    }
}

class PMTitle: UIButton {
    
    open var textColor: UIColor {
        return UIColor(hexColor: "#AAB2BD")
    }
    
    var isFocus: Bool = false
    var focusColor: UIColor = UIColor.clear
    var title: String!
    
    convenience init(frame: CGRect, title: String, color: UIColor, focus: Bool) {
        self.init(frame: frame)
        self.title = title
        self.isFocus = focus
        self.focusColor = color
        prepare()
    }
    
    func prepare() {
        setTitle(self.title, for: .normal)
        setTitleColor(self.focusColor, for: .normal)
        backgroundColor = UIColor.white
        setTitleColor(textColor, for: .normal)
        fonts()
    }
    
    func fonts() {
        self.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Semibold", size: 12)
    }
    
    func isFocus(focus: Bool) {
        if focus {
            backgroundColor = focusColor
            setTitleColor(UIColor.white, for: .normal)
        } else {
            backgroundColor = UIColor.white
            setTitleColor(textColor, for: .normal)
        }
    }
}

protocol PMTitleStripDelegate { func selectTitle() }


