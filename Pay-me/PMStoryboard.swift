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
    class func messagesStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.Storyboard.kMessages, bundle: Bundle.main)
    }
    
    class func notifyStoryboard() -> UIStoryboard {
        return UIStoryboard(name: Constants.Storyboard.kNotify, bundle: Bundle.main)
    }

    
    class func createMessage() -> UINavigationController {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kMessages) as! UINavigationController)
    }

    class func createNotificaciones() -> UINavigationController {
        return (notifyStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kNotificaciones) as! UINavigationController)
    }
    
    class func createServicioGuardado() -> UINavigationController {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kServicioGuardado) as! UINavigationController)
    }
    
    class func createPagoExitoso() -> UINavigationController  {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kPagoExitoso) as! UINavigationController)
    }
    
    class func createPagoNoAutorizadoA() -> UINavigationController  {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kPagoNoAutorizadoA) as! UINavigationController)
    }
    
    class func createPagoNoAutorizadoB() -> UINavigationController  {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kPagoNoAutorizadoB) as! UINavigationController)
    }
    
    class func createTarjetaCreditoNoValidaA() -> UINavigationController  {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kTarjetaCreditoNoValidaA) as! UINavigationController)
    }
    
    class func createAdicionarTarjeta() -> UINavigationController  {
        return (messagesStoryboard().instantiateViewController(withIdentifier: Constants.ViewController.kPagoNoAutorizadoB) as! UINavigationController)
    }
}
