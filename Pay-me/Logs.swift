//
//  Logs.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 24/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func printStaticData() {
        let sd = Session.sharedInstance.staticData
        sd.serviciosGenerales.forEach {
            print("---Servicios Generales---")
            print($0.name)
            
            print("---Categorias---")
            $0.categorias.forEach {
                print($0.name)
                
                print("---Servicios---")
                $0.items.forEach {
                    print($0.name)
                    
                    print("---Empresa---")
                    print($0.empresa.shortName)
                }
            }
            print("--------------")
        }
    }
}
