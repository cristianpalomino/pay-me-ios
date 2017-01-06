//
//  HomeViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 05/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class HomeViewController: PMViewController , UIScrollViewDelegate{
    
    var notificacionesHome = [NotificacionHome]()
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtPageTitle: UITextView!
    @IBOutlet weak var txtBody: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var modelViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var modelImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        self.scrollView.frame = CGRect(x:0, y:25, width:self.scrollView.frame.width, height:self.scrollView.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        //let scrollViewHeight:CGFloat = self.scrollView.frame.height
        let contentViewHeight: CGFloat = self.contentView.frame.height
        //let contentViewWidth = self.contentView.frame.width
        let modelImageViewWidth : CGFloat = self.modelImageView.frame.width
        
        txtPageTitle.textAlignment = .center
        txtPageTitle.text = "!Cambia tu tarjeta de credito!"
        
        
        let imgOne = UIImageView(frame: CGRect(x:modelViewLeftConstraint.constant,
                                               y:0,
                                               width:modelImageViewWidth,
                                               height:contentViewHeight))
        imgOne.image = UIImage(named: "Slide1")
        let imgTwo = UIImageView(frame: CGRect(x:modelViewLeftConstraint.constant,
                                               y:0,
                                               width:modelImageViewWidth,
                                               height:contentViewHeight))
        imgTwo.image = UIImage(named: "Slide2")
        let imgThree = UIImageView(frame: CGRect(x:modelViewLeftConstraint.constant,
                                                 y:0,
                                                 width:modelImageViewWidth,
                                                 height:contentViewHeight))
        imgThree.image = UIImage(named: "Slide3")
        
        /*
        let imgOne : UIImageView = modelImageView
        let imgTwo : UIImageView = modelImageView
        let imgThree : UIImageView = modelImageView
        
        imgOne.image = UIImage(named: "Slide1")
        imgTwo.image = UIImage(named: "Slide2")
        imgThree.image = UIImage(named: "Slide3")
        
        imgTwo.frame.origin.x = modelImageView.frame.width
        imgThree.frame.origin.x = modelImageView.frame.width*2
        */
        
        let viewContainerOne : UIView = UIView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width:scrollViewWidth,
                                                             height: contentViewHeight))
        let viewContainerTwo : UIView = UIView(frame: CGRect(x: scrollViewWidth,
                                                             y: 0,
                                                             width:scrollViewWidth,
                                                             height: contentViewHeight))
        let viewContainerThree : UIView = UIView(frame: CGRect(x: scrollViewWidth*2,
                                                               y: 0,
                                                               width:scrollViewWidth,
                                                               height: contentViewHeight))
        
        
        viewContainerOne.addSubview(imgOne)
        viewContainerTwo.addSubview(imgTwo)
        viewContainerThree.addSubview(imgThree)
        
        
        
        self.scrollView.addSubview(viewContainerOne)
        self.scrollView.addSubview(viewContainerTwo)
        self.scrollView.addSubview(viewContainerThree)
        
        
        
        //4
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly

        switch currentPage {
        case 0:
            txtPageTitle.text = "!Cambia tu tarjeta de credito!"
            break
        case 1:
            txtPageTitle.text = "Este mes tu consumo es ..."
            break
        case 2:
            txtPageTitle.text = "Paga ahora la universidad"
            break
        default:
            break
        }
        /*if Int(currentPage) == 0{
            txtPageTitle.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
        }else if Int(currentPage) == 1{
            txtPageTitle.text = "I write mobile tutorials mainly targeting iOS"
        }else if Int(currentPage) == 2{
            txtPageTitle.text = "And sometimes I write games tutorials about Unity"
        }else{
            txtPageTitle.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
        }*/

    }
    

}
