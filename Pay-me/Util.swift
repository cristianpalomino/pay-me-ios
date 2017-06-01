//
//  Util.swift
//  payme
//
//  Created by Analista ios on 6/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import Foundation
import UIKit

class Util {
    static let method = Util()  // singleton object
    
    init() {
        // do initial setup or establish an initial connection
    }
    
    func getData() -> [String:String] {
        // do some operations
        return ["someData" : "someData"]
    }
    
  
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
}
