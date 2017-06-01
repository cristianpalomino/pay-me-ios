//
//  BienvenidoViewController.swift
//  payme
//
//  Created by Franco Paredes on 6/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class BienvenidoViewController: PMViewController , UIScrollViewDelegate{

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tutorial1View: UIView!
    @IBOutlet var tutorial2View: UIView!
    @IBOutlet var tutorial3View: UIView!
   
    @IBOutlet weak var tutorialScroll: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationController?.isNavigationBarHidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        setGradientBackground()
        // Do any additional setup after loading the view.
        //Scroll Tutorial
        initUX()
        
//        Timer.scheduledTimer(timeInterval: 2,
//                             target: self,
//                             selector: #selector(moveToNextPage),
//                             userInfo: nil, repeats: true)
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
             self.navigationController?.isNavigationBarHidden = true
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initUX()
    {
        let widthScreen =  UIScreen.main.bounds.size.width
        let hightScreen =  UIScreen.main.bounds.size.height - 50
        
        tutorialScroll.addSubview(self.tutorial1View)
        self.tutorial1View.frame = self.tutorialScroll.bounds
        
        print(widthScreen)
        tutorialScroll.addSubview(self.tutorial2View)
        self.tutorial2View.frame = self.tutorialScroll.bounds
        self.tutorial2View.frame.origin.x = widthScreen
        print(widthScreen * 2)
        tutorialScroll.addSubview(self.tutorial3View)
        self.tutorial3View.frame =  self.tutorialScroll.bounds
        self.tutorial3View.frame.origin.x = widthScreen * 2
      
        //4
        self.tutorialScroll.contentSize = CGSize(width:widthScreen * 3, height:hightScreen)
        self.tutorialScroll.delegate = self
//        self.pageControl.currentPage = 0
        
    
        
    }
    
    
    func setGradientBackground() {
        //        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        //        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        //        let gradientLayer = CAGradientLayer()
        //        gradientLayer.colors = [ colorTop, colorBottom]
        //        gradientLayer.locations = [ 0.0, 1.0]
        //        gradientLayer.frame = self.view.bounds
        //        self.view.layer.addSublayer(gradientLayer)
        
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.view.bounds
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [UIColor(hexColor: "#FF00AB").cgColor, //(hex: "FF00a8").cgColor,
            UIColor(hexColor: "#8140d4").cgColor,
            UIColor(hexColor: "#0083FF").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        self.nextButton.setBackgroundImage(image, for: UIControlState.normal)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
//        if Int(currentPage) == 0{
//            textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
//        }else if Int(currentPage) == 1{
//            textView.text = "I write mobile tutorials mainly targeting iOS"
//        }else if Int(currentPage) == 2{
//            textView.text = "And sometimes I write games tutorials about Unity"
//        }else{
//            textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
//            // Show the "Let's Start" button in the last slide (with a fade in animation)                     UIView.animate(withDuration: 1.0, animations: { () -> Void in
//            self.startButton.alpha = 1.0
//        })
    }

    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.tutorialScroll.frame.width
        let maxWidth:CGFloat = pageWidth * 3
        let contentOffset:CGFloat = self.tutorialScroll.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.tutorialScroll.scrollRectToVisible(CGRect(x:slideToX,
                                                       y:0, width:pageWidth,
                                                       height:self.tutorialScroll.frame.height),
                                                animated: true)
    }
    @IBAction func next(_ sender: Any) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}
