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
    
    private func prepare() {
        backgroundColor = UIColor.white

        scrollView = UIScrollView(frame: .zero)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.clear
        addSubview(scrollView)
        
        viewStrip = UIView(frame: .zero)
        viewStrip.backgroundColor = UIColor.clear
        scrollView.addSubview(viewStrip)
        stripBorders()
    }
    
    private func update() {
        scrollView.frame = scrollRect
        createTitles()

        viewStrip.frame = stripRect
        viewStrip.center.y = self.scrollView.center.y
        viewStrip.layer.cornerRadius = self.viewStrip.frame.height * 0.5
    }
    
    func createTitles() {
        origin = midFrame
        
        for item in self.titles {
    
            let button = PMTitle(frame: .zero,
                                 title: item.title,
                                 color: item.color,
                                 focus: false)
            button.sizeToFit()
        
            button.addTarget(self, action: #selector(self.action(sender:)), for: .touchUpInside)

            button.frame.origin.x = originTitles
            button.frame.size = CGSize(width: button.frame.width + titleSpacing,
                                       height: stripRect.height * 0.8)
            button.center.y = scrollView.center.y
        
            button.layer.cornerRadius = button.frame.height * 0.5
        
            scrollView.addSubview(button)
            buttons.append(button)
                    
            origin = button.frame.width
        }
        
        buttons[0].isFocus(focus: true)
        
        origin = midFrame
        scrollView.contentSize = CGSize(width: contentSize, height: stripRect.height)
    }
    
    func stripBorders() {
        viewStrip.layer.borderColor = borderColor.cgColor
        viewStrip.layer.borderWidth = 1
    }
    
    var titleSpacing: CGFloat = 50
    
    var originTitles: CGFloat = 0
    
    var midFrame: CGFloat {
        return self.frame.width * 0.3
    }
    
    var contentSize: CGFloat {
        return self.originTitles + (stripRect.origin.x * 2)
    }
    
    var origin: CGFloat {
        set (nv) {
            originTitles = originTitles + nv
        }
        get {
            return originTitles
        }
    }
    
    var stripRect: CGRect {
        let h = self.bounds.height * 0.75
        let x = self.bounds.width * (10 / self.bounds.width)
        return CGRect(x: x,
                      y: self.bounds.origin.y,
                      width: originTitles,
                      height: h)
    }
    
    var scrollRect: CGRect {
        return CGRect(x: self.bounds.origin.x,
                      y: self.bounds.origin.y,
                      width: self.bounds.width,
                      height: self.bounds.height - 1)
    }
    
    func action(sender: PMTitle) {
        sender.isFocus(focus: true)
        let notFocus = buttons.filter { $0 != sender }
        notFocus.forEach { $0.isFocus(focus: false) }
        delegate?.selectTitle()
    }
}

class PMTitle: UIButton {
    
    open var textColor: UIColor {
        return borderColor
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
    
    var midSize: CGFloat {
        return self.frame.width * 0.5
    }
}

protocol PMTitleStripDelegate { func selectTitle() }


