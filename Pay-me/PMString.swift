//
//  PMString.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 6/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension NSRange {
    func range(for str: String) -> Range<String.Index>? {
        
        guard location != NSNotFound else { return nil }
        guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex, offsetBy: location, limitedBy: str.utf16.endIndex) else { return nil }
        guard let toUTFIndex = str.utf16.index(fromUTFIndex, offsetBy: length, limitedBy: str.utf16.endIndex) else { return nil }
        guard let fromIndex = String.Index(fromUTFIndex, within: str) else { return nil }
        guard let toIndex = String.Index(toUTFIndex, within: str) else { return nil }
        return fromIndex ..< toIndex
    }
}
