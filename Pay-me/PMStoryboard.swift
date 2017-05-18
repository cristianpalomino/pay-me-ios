//
//  PMStoryboard.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 29/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    class func agregarServicioStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "AgregarServicio", bundle: Bundle.main)
    }
    
    class func notifyStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.Storyboard.kNotify, bundle: Bundle.main)
    }
    
    class func homeStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.Storyboard.kHome, bundle: Bundle.main)
    }
    
    class func settingsStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.Storyboard.kConfig, bundle: Bundle.main)
    }
    
    class func flowAgregarServicio() -> UIViewController {
        return agregarServicioStoryboard().instantiateViewController(withIdentifier: "AgregarServicioID")
    }
    
    class func createNotificaciones() -> UINavigationController {
        return (notifyStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kNotificaciones) as! UINavigationController)
    }
    
    class func createNotificacionesHome() -> UINavigationController {
        return (homeStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kNotificacionesHome) as! UINavigationController)
    }
    
    class func createSettings() -> UINavigationController  {
        return (settingsStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kSettings) as! UINavigationController)
    }
}
