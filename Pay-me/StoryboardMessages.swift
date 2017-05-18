//
//  StoryboardMensajes.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 16/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension UIStoryboard {
    
    class func messagesStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Messages", bundle: Bundle.main)
    }
    
    class func createMessage(information: PMMessageViewController.Information) -> UINavigationController {
        let nav = messagesStoryboard().instantiateViewController(withIdentifier: "navDefaultMessage") as! UINavigationController
        let mvc = nav.topViewController as! PMMessageViewController
        mvc.information = information
        return nav
    }
}
