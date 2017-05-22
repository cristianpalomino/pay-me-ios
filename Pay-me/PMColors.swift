//
//  PMColors.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 18/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    class var pmPaleGrey80: UIColor {
        return UIColor(red: 230.0 / 255.0, green: 233.0 / 255.0, blue: 237.0 / 255.0, alpha: 0.8)
    }
    
    class var pmWhite50: UIColor {
        return UIColor(white: 255.0 / 255.0, alpha: 0.5)
    }
    
    class var pmWhite20: UIColor {
        return UIColor(white: 255.0 / 255.0, alpha: 0.2)
    }
    
    class var pmSlateGrey: UIColor {
        return UIColor(red: 101.0 / 255.0, green: 109.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }
    
    class var pmPaleGreyTwo: UIColor {
        return UIColor(red: 230.0 / 255.0, green: 233.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
    }
    
    class var pmCharcoalGrey: UIColor {
        return UIColor(red: 67.0 / 255.0, green: 74.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
    }
    
    class var pmDeepSkyBlue: UIColor {
        return UIColor(red: 0.0, green: 131.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    public class func appBlueColor() -> UIColor {
        return UIColor(red: 0/255, green: 131/255, blue: 255/255, alpha: 1)
    }
    
    public class func appLigthGrayBorderColor() -> UIColor {
        return UIColor(red: 215/255, green: 223/255, blue: 229/255, alpha: 1)
    }
    
    public class func appGrayBorderColor() -> UIColor {
        return UIColor(red: 204/255, green: 209/255, blue: 217/255, alpha: 1)
    }
    
    class var pmSilver: UIColor {
        return UIColor(red: 204.0 / 255.0, green: 209.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0)
    }
    
    //Etiquetas
    public class func appRedColor() -> UIColor {
        return UIColor(red: 218/255, green: 68/255, blue: 83/255, alpha: 1)
    }
    
    public class func appGrayColor() -> UIColor {
        return UIColor(red: 170/255, green: 178/255, blue: 189/255, alpha: 1)
    }
    
    //Historico
    public class func appGreenHistoricoColor() -> UIColor {
        return UIColor(red: 160/255, green: 212/255, blue: 104/255, alpha: 1)
    }
    
    public class func appRedHistoricoColor() -> UIColor {
        return UIColor(red: 218/255, green: 68/255, blue: 83/255, alpha: 1)
    }
    
    //Agenda
    public class func appGrayAgendaColor() -> UIColor {
        return UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
    }
    public class func appDarkGrayAgendaColor() -> UIColor {
        return UIColor(red: 67/255, green: 74/255, blue: 85/255, alpha: 1)
    }
}


