//
//  ApiUtil.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

struct RequestUtil {
    
    typealias Completion        = ((PaymeApiResult)  -> Void)
}

open class PaymeApiResult {
    
    let error   :PaymeError?
    let data    :Any?
    let result  :Result
    
    init(data: Any?, error: PaymeError?) {
        
        self.error  = error
        self.data   = data
        
        if error == nil {
            result = .success
        }
        else {
            result = .failure
        }
    }
}
