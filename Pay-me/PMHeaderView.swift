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
    }
    
    func createTitles() {
        
    }
}



