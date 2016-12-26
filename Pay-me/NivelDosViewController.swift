//
//  NivelDosViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 16/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NivelDosViewController: PMViewController {

    @IBOutlet var topIcon           :UIImageView!
    @IBOutlet var rigthTopIcon      :UIImageView!
    @IBOutlet var leftTopIcon       :UIImageView!
    @IBOutlet var rigthMiddleIcon   :UIImageView!
    @IBOutlet var leftMiddleIcon    :UIImageView!
    @IBOutlet var rigthBottomIcon   :UIImageView!
    @IBOutlet var leftBottomIcon    :UIImageView!
    @IBOutlet var bottomIcon        :UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        whiteTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initComponents() {
        let imageviews = [topIcon,rigthTopIcon,leftTopIcon,rigthMiddleIcon,leftMiddleIcon,rigthBottomIcon,leftBottomIcon,bottomIcon]
        for item in imageviews {
            item?.image = item?.image!.withRenderingMode(.alwaysTemplate)
            item?.tintColor = UIColor.appBlueColor()
        }
    }
}

extension NivelDosViewController {

}
