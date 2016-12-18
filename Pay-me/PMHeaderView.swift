//
//  PMHeaderView.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMHeaderView: UIView {
    
    var scroll :UIScrollView!
    var titles = [String]()
    
    init(frame: CGRect, titles :[String]) {
        super.init(frame: frame)
        self.titles = titles
        createComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PMHeaderView {
    
    func createComponents() {
        let width = self.frame.width
        let heigth = self.frame.height
        let  frame = CGRect(x: 0, y: 0, width: width, height: heigth * 0.75)
        scroll = UIScrollView(frame: frame)
        scroll.backgroundColor = UIColor.white
        scroll.center = CGPoint(x: width * 0.5, y: heigth * 0.5)
        scroll.showsHorizontalScrollIndicator = false
        self.addSubview(scroll)
        createTitles()
    }
    
    func createTitles() {
        for (i, title) in titles.enumerated() {
            let frame = CGRect(x: i * 100, y: 0, width: 100, height: Int(self.frame.height))
            let label = UIButton(frame: frame)
            label.titleLabel?.text = title
            self.scroll.addSubview(label)
        }
        scroll.contentSize = CGSize(width: titles.count * 50, height: Int(self.scroll.frame.height))
        addBorder()
    }
    
    func addBorder() {
        let sframe = self.scroll.frame
        let width = self.scroll.contentSize.width
        let frame = CGRect(x: 0, y: 0, width: width, height: sframe.height)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = scroll.frame.height * 0.5
        scroll.addSubview(view)
    }
}



