//
//  HomeViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 05/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class HomeViewController: PMViewController{
    
    var notificacionesHome = [NotificacionHome]()
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtPageTitle: UITextView!
    @IBOutlet weak var txtBody: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var modelViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var modelImageView: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        prepareViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension HomeViewController{
    
    override func initComponents() {
        prepareData()
        
    }
    
    func prepareData(){
        
        let notificacionHomeOne = NotificacionHome(data: ["!Cambia tu tarjeta de credito!","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing"])
        
        let notificacionHomeTwo = NotificacionHome(data: ["Este mes tu consumo es ...", "Lorem ipsum dolor sit er elit lamet, consectetaur"])
        
        let notificacionHomeThree = NotificacionHome(data: ["Paga ahora la universidad","Lorem ipsum dolor sit er elit lamet, consectetaur cillium"])
        
        notificacionesHome = [notificacionHomeOne, notificacionHomeTwo, notificacionHomeThree]
    }
    
    func prepareViews(){
        self.scrollView.frame = CGRect(x:0, y:25, width:self.scrollView.frame.width, height:self.scrollView.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        //let scrollViewHeight:CGFloat = self.scrollView.frame.height
        let contentViewHeight: CGFloat = self.contentView.frame.height
        //let contentViewWidth = self.contentView.frame.width
        let modelImageViewWidth : CGFloat = self.modelImageView.frame.width
        
        txtPageTitle.textAlignment = .center
        txtBody.textAlignment = .center
        
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
        
        
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
        self.btnBack.isHidden =  true
    }
    
}

extension HomeViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1

        self.pageControl.currentPage = Int(currentPage);

        let notificionHomeData : NotificacionHome = notificacionesHome[Int(currentPage)]
        let title = notificionHomeData.messageTitle
        let body = notificionHomeData.messageBody
        
        switch currentPage {
        case 0:
            txtPageTitle.text = title
            txtBody.text = body
            break
        case 1:
            txtPageTitle.text = title
            txtBody.text = body
            break
        case 2:
            txtPageTitle.text = title
            txtBody.text = body
            break
        default:
            break
        }
    }
    
}
