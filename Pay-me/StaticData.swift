//
//  Empresa.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 23/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import SwiftyJSON
import Foundation

class Static {
    
    var serviciosGenerales = [ServicioGeneral]()
    
    init() {
        let path = Bundle.main.path(forResource: "StaticData", ofType: ".json")
        let data = NSData(contentsOfFile: path!) as! Data
        let json = JSON(data: data)
        
        json["serviciosGenerales"].arrayValue.forEach{self.serviciosGenerales.append(ServicioGeneral(json: $0))}
    }
}

class ServicioGeneral {
    
    var categorias      = [Categoria]()
    var name            :String!
    var logo            :String!
    
    init(json :JSON) {
        self.name = json["name"].stringValue
        
        if let ja = json["categorias"].array {
            if !ja.isEmpty {
                json["categorias"].arrayValue.forEach{self.categorias.append(Categoria(json: $0))}
            }
        }
    }
}

class Categoria {
    
    var servicios       = [Servicio]()
    var idCategoria     :String!
    var name            :String!
    
    init(json :JSON) {
        self.name = json["name"].stringValue
        self.idCategoria = json["idCategoria"].stringValue
        
        if !json["servicios"].isEmpty {
            json["servicios"].arrayValue.forEach{self.servicios.append(Servicio(json: $0))}
        }
    }
}

class Empresa {
    
    var idCompany       :String!
    var idCommerce      :String!
    var name            :String!
    var shortName       :String!
    var logo            :String!
    var recurrence      :String!
    var daysIssue       :String!
    var pais            :String!
    var ciudad          :String!
    var departamento    :String!
    var direccion       :String!
    var telefono        :String!
    var correo          :String!
    
    init(json :JSON) {
        
        self.idCompany = json["idCompany"].stringValue
        self.idCommerce = json["idCommerce"].stringValue
        self.name = json["name"].stringValue
        self.shortName = json["shortName"].stringValue
        self.logo = json["logo"].stringValue
        self.recurrence = json["recurrence"].stringValue
        self.daysIssue = json["dayIssue"].stringValue
        self.pais = json["pais"].stringValue
        self.ciudad = json["ciudad"].stringValue
        self.departamento = json["departamento"].stringValue
        self.direccion = json["direccion"].stringValue
        self.telefono = json["telefono"].stringValue
        self.correo = json["correo"].stringValue
    }
}

class Servicio {
    
    var idService       :String!
    var name            :String!
    var logo            :String!
    var logo_2          :String!
    var codeDescription :String!
    var codeValidation  :String!
    var empresa         :Empresa!
    
    init(json :JSON) {
        
        self.idService = json["idService"].stringValue
        self.name = json["name"].stringValue
        self.logo = json["logo"].stringValue
        self.logo_2 = json["logo_2"].stringValue
        self.codeDescription = json["codeDescription"].stringValue
        self.codeValidation = json["codeValidation"].stringValue
        self.empresa = Empresa(json: json["empresa"])
    }
}
