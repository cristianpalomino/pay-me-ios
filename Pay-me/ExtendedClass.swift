//
//  ExtendedClass.swift
//  payme
//
//  Created by Franco Paredes on 6/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize :CGSize = CGSize(width: self.frame.size.width, height: 54)
        return newSize
    }
}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension String {
    
    func substringc(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        return self.substring(with: Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex)))
    }
    
}

extension UIColor {
    convenience init(hexColor hex: String) {
        let alpha: Float = 100
        let hexLength = hex.characters.count
        if !(hexLength == 7 || hexLength == 9) {
                       self.init(white: 0, alpha: 1)
            return
        }
        // Establishing the rgb color
        var rgb: UInt32 = 0
        let s: Scanner = Scanner(string: hex)
        // Setting the scan location to ignore the leading `#`
        s.scanLocation = 1
        // Scanning the int into the rgb colors
        s.scanHexInt32(&rgb)
        // Creating the UIColor from hex int
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha / 100)
        )
    }
}

extension UITabBarController {
    func setTabBarVisible(visible:Bool, duration: TimeInterval, animated:Bool) {
        if (tabBarIsVisible() == visible) { return }
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        // animation
        UIView.animate(withDuration: animated ? duration : 0.0) {
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
            self.view.frame = CGRect(x:0, y:0,width: self.view.frame.width, height: self.view.frame.height + offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return self.tabBar.frame.origin.y < self.view.frame.maxY
    }
}
 

extension UIButton{
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.bounds
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
    
        self.setBackgroundImage(image, for: UIControlState.normal)
    }
}

extension UIButton{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.characters.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
// btnRegister.addTextSpacing(spacing: 4.5)

extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}
// lblOne.addTextSpacing(spacing: 4.5)

extension UITextField{
    func addPlaceholderSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.placeholder!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.placeholder!.characters.count))
        self.attributedPlaceholder = attributedString
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}



// txtUserName.addPlaceholderSpacing(spacing: 4.5)

extension UINavigationItem{
    func addSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.title!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.title!.characters.count))
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold)
        label.attributedText = attributedString
        label.sizeToFit()
        self.titleView = label
    }
}
// navigationItem.addSpacing(spacing: 2.5)


// superindices  y subindices
extension NSMutableAttributedString
{
    enum scripting : Int
    {
        case aSub = -1
        case aSuper = 1
    }
    
    func characterSubscriptAndSuperscript(string:String,
                                          characters:[Character],
                                          type:scripting,
                                          fontSize:CGFloat,
                                          scriptFontSize:CGFloat,
                                          offSet:Int,
                                          length:[Int],
                                          alignment:NSTextAlignment)-> NSMutableAttributedString
    {
        let paraghraphStyle = NSMutableParagraphStyle()
        // Set The Paragraph aligmnet , you can ignore this part and delet off the function
        paraghraphStyle.alignment = alignment
        
        var scriptedCharaterLocation = Int()
        //Define the fonts you want to use and sizes
        
        let stringFont = UIFont(name: "SanFranciscoDisplay-Regular", size: fontSize)//UIFont.boldSystemFont(ofSize: fontSize)
        let scriptFont = UIFont(name: "SanFranciscoDisplay-Regular", size: scriptFontSize)//UIFont.boldSystemFont(ofSize: scriptFontSize)
        // Define Attributes of the text body , this part can be removed of the function
        let attString = NSMutableAttributedString(string:string,
                                                  attributes: [NSFontAttributeName:stringFont,
                                                               NSForegroundColorAttributeName:UIColor.black,
                                                               NSParagraphStyleAttributeName: paraghraphStyle])
        
        // the enum is used here declaring the required offset
        let baseLineOffset = offSet * type.rawValue
        // enumerated the main text characters using a for loop
        for (i,c) in string.characters.enumerated()
        {
            // enumerated the array of first characters to subscript
            for (theLength,aCharacter) in characters.enumerated()
            {
                if c == aCharacter
                {
                    // Get to location of the first character
                    scriptedCharaterLocation = i
                    //Now set attributes starting from the character above
                    attString.setAttributes([NSFontAttributeName:scriptFont,
                                             // baseline off set from . the enum i.e. +/- 1
                        NSBaselineOffsetAttributeName:baseLineOffset,
                        NSForegroundColorAttributeName:UIColor.orange],
                                            // the range from above location
                        range:NSRange(location:scriptedCharaterLocation,
                                      // you define the length in the length array 
                            // if subscripting at different location 
                            // you need to define the length for each one
                            length:length[theLength]))
                    
                }
            }
        }
        return attString}
}
