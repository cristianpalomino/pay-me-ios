//
//  PMItemView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 04/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMItemView: UIButton {
    var shouldSetupFrame = true

    var circleView: UIView!
    var labelItem: UILabel!
    var imageItem: UIImageView!
    
    var item: (title: String, image: UIImage)!
    
    init(item: (title: String, image: UIImage)) {
        super.init(frame: .zero)
        self.item = item
        prepare()
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
        update()
    }
    
    func prepare() {
        initLabel()
        initCircle()
        initImage()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    func initImage() {
        imageItem = UIImageView()
        imageItem.image = item.image.withRenderingMode(.alwaysTemplate)
        imageItem.tintColor = UIColor.pmDeepSkyBlue
        imageItem.contentMode = .scaleAspectFit
        imageItem.translatesAutoresizingMaskIntoConstraints = false
        circleView.addSubview(imageItem)
        
        imageItem.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        imageItem.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
    }
    
    func initCircle() {
        circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleView)
        
        circleView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        circleView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        circleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        circleView.bottomAnchor.constraint(equalTo: labelItem.topAnchor).isActive = true
    }
    
    func initLabel() {
        labelItem = UILabel()
        labelItem.text = item.title
        labelItem.textAlignment = .center
        labelItem.textColor = UIColor.pmCharcoalGrey
        labelItem.font = UIFont.SFMedium(size: 10)
        labelItem.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelItem)
        
        labelItem.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelItem.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        labelItem.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func update() {
        if shouldSetupFrame {
            //addCircleBorder()
            shouldSetupFrame = false
        }
    }
    
    override func addCircleBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = bounds.height * 0.5
    }
    
    var frameImage: CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    var servicio: String? {
        return labelItem.text
    }
}
