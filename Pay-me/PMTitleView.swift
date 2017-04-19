//
//  PMTitleView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 17/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMTitleView: UIView {
    
    var pmViewController: PMViewController?
    
    @IBOutlet var backButton:   UIButton!
    @IBOutlet var titleLabel:   UILabel!
    @IBOutlet var searchButton: UIButton!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Helper Methods
    
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
    }
    
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

    
    @IBAction func tapBack() {
        self.pmViewController?.tapBack()
    }
    
    @IBAction func tapSearch() {
        self.pmViewController?.tapSearch()
    }
}



