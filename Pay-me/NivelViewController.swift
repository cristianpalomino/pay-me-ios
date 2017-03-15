//
//  NivelViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 1/03/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension NivelDosViewController {

    func educacionData() -> [(String, UIImage)] {
        let educacion = [("Universidades", UIImage(named: "universidades")!),
                         ("Colegios", UIImage(named: "colegios")!),
                         ("Postgrado", UIImage(named: "postgrado")!),
                         ("Institutos", UIImage(named: "institutos")!),
                         ("Maestrias", UIImage(named: "maestrias")!),
                         ("Pre-escolar", UIImage(named: "prescolar")!),
                         ("Idiomas", UIImage(named: "idiomas")!),
                         ("Academias", UIImage(named: "academias")!)]
        return educacion
    }
}
