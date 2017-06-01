//
//  ProfilePhotoViewController.swift
//  payme
//
//  Created by Franco Paredes on 4/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit
import ZoomTransitioning

class ProfilePhotoViewController: PMViewController, ZoomTransitionDestinationDelegate {

    @IBOutlet weak var largeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func transitionDestinationImageViewFrame(forward: Bool) -> CGRect
    {
        if forward {
            let x: CGFloat = 0.0
            let y = topLayoutGuide.length
            let width = view.frame.width
            let height = width * 2.0 / 3.0
            return CGRect(x: x, y: y, width: width, height: height)
        } else {
            return largeImageView.convert(largeImageView.bounds, to: view)
        }
    }
    
    func transitionDestinationWillBegin() {
        largeImageView.isHidden = true
    }
    
    func transitionDestinationDidEnd(transitioningImageView imageView: UIImageView) {
        largeImageView.isHidden = false
        largeImageView.image = imageView.image
    }
    
    func transitionDestinationDidCancel() {
        largeImageView.isHidden = false
    }
}
