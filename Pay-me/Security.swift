//
//  Security.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class Security {
    
    struct Keys {
        static let kPublic = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt9OxL3WSvhkJYnFSb/m5db5BGBlE8aPqpbKfhtboeSNLb7xhZIFE3ZIUsC1dFX3QMOX4qiZBnN0H+WoEds/aEn0qnKDJrgaf/mBn1YZsad7iVD2RNGx6pdPZtOXSc9+HrQ0LuGrQpIiXmJ/LrA+rcWzFL68XupCn71k1t8n7JPvqyc3LfrJq6naE20okbOVNpch9t/AlWfbce4filfbr3GIYKEsreB4tRK6gg/brv6MMRy+69HJv3vHZt2NRGEFwVJu1Jj7KCA5LM/txfOiyIrRPsADxjk2PoSvzcpGczT8vqfQtXQaim94iDzVMWPGG9XHEb1T5w+b0xEJkx1L7TQIDAQAB"
        static let kPrivate = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC307EvdZK+GQlicVJv+bl1vkEYGUTxo+qlsp+G1uh5I0tvvGFkgUTdkhSwLV0VfdAw5fiqJkGc3Qf5agR2z9oSfSqcoMmuBp/+YGfVhmxp3uJUPZE0bHql09m05dJz34etDQu4atCkiJeYn8usD6txbMUvrxe6kKfvWTW3yfsk++rJzct+smrqdoTbSiRs5U2lyH238CVZ9tx7h+KV9uvcYhgoSyt4Hi1ErqCD9uu/owxHL7r0cm/e8dm3Y1EYQXBUm7UmPsoIDksz+3F86LIitE+wAPGOTY+hK/NykZzNPy+p9C1dBqKb3iIPNUxY8Yb1ccRvVPnD5vTEQmTHUvtNAgMBAAECggEAeeTcrAy5dmZhq65bLLcZ/HJg9Zrj9Zts39z3HVFqK9F0ly4CIsP5JzdTkpMyEysvHw2PezwM6/hA7mkXdrVS9EmdNOkFcukftGy2zYbqYrWRvKxqmamJFmbJCMQQbhd9/wkUiYACw+dzJphnVLu7QmYOxxTClkqPoQ21qh4784QbZXU3wQh/YlB7bxRV7xB/aaxnXkff1sJKxvmVrdBMM8K1BlufVFPposa5Mot8eIx9xK0Iqw4iBwNLA5AQvrDBzO6PrVluLeE9/+7iy30RaSzKeFCnzvN+lR9fSSnrmsvIBl2A8SRrAUPH2s+pPus1cYO8BuZ1ExP/PPiDGE9hnQKBgQDupZ/PWIuRfvOhKsFloVJF5Uk7/Bz4mSfYG/tFRCZULMMgfIOELJGGDgWkLCsEdjl76YGeKfOCtEdfhoKsdXHyqytxgNkt1KhyP7AynBfLuQLS521chYoZZ83KMWNeM215ZumXPPBfUDFnQSy57c3SETxuME+Z5/33IaZRadBHfwKBgQDFMZnwowNsyxFrtm0ogTSPsd1/s6QbITrVr7pY9B1WvRyS902VonHC8xnzC6okijlbY2U7/pWKgV2ziJqiUoJLO1wB/6aExtydPkc2Q3WppaG/xKD9NHpb1c/sZg5sYWxrWMCEwVX+1Wqjo212+DAj3xIJGfJjZvVCdWMIqyHDMwKBgQCe8Z6jmaSzTetz3ycZyj0ioliJZBvjkxYPgGt1MbOZgoqfW264nHp732DwfB5WhWs51UboEabG2c1jmRH1TO+MoWZ43UlIlgduuG5g9sd+fwWbdFnJMoPM8e8FCKnW9semAN35RbQOtzmAPM9OMk1P6PznorORnQrwCvBb7u6yfwKBgDyJ9dDCuxJzZW3EG88Lm69h07aY2BDcKsvfnz4f88HlXRhhhBgkPviy2YycUCfXp7Q+152Lky1qefHcRlz/J7EhECYs7lplEuXTcNlf7Iegqf/Nxf72VXpMMgFJc7QiVL7ACJq5IEWUD6EdU0Xq/ByHJ2pT5O5PdYxprXXD1CGxAoGBAOgL0SfuL/mKI2YXnda/9F990Bu/j1ci4uHWZF9X1Brx96ciZITLmGEOB9HktcY1L+dduu3YZKRXa6spBk5baWp/zEGN7uuwjQjhKIfX6S5IjH+SGcyg7dafW+q7NyyH8YtQ2pCSxz7LXLejsKg9V5uqDIJEQGlsJfg3Ovsr/UDw"
    }
}

extension String {
    
    func encrypt() -> String {
        return RSA.encryptString(self, publicKey: Security.Keys.kPublic)
    }
    
    func decrypt() -> String {
        return RSA.decryptString(self, privateKey: Security.Keys.kPrivate)
    }
}
