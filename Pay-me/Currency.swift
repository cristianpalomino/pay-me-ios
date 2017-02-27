//
//  Currency.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension String {
    
    func currency() -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.maximumFractionDigits = 2
        nf.locale = Locale(identifier: "es_PE")
        
        guard let int = Int(self) else {
            return "NONE"
        }
        
        let number = NSNumber(integerLiteral: int)
        guard let currency = nf.string(from: number) else {
            return "NONE"
        }
        
        return currency
    }
}
