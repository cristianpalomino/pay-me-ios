//
//  ServiciosParams.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Request {
    
    var idCardholder    :String = Constants.Debug.ID_CARDHOLDER.encrypt()
    var idCommerce      :String = Constants.Debug.ID_COMERCIO
    var macAddress      :String = Constants.Debug.MAC_ADDRESS.encrypt()
 
    func toParams() -> [String : Any] {
        var params :[String : Any] = [:]
        params["idCardholder"]  = idCardholder
        params["idCommerce"]    = idCommerce
        params["macAddress"]    = macAddress
        return params
    }
}

class RequestAgregarServicio : Request {
    
    var verifiedService     :String!
    
}

class RequestConsultarDeudas : Request {
    
    var idCompany           :String!
    var idService           :String!
    var serviceIdentifier   :String!
    
    init(idCompany :String, idService :String, serviceIdentifier :String) {
        self.idCompany          = idCompany
        self.idService          = idService
        self.serviceIdentifier  = serviceIdentifier
    }
    
    override func toParams() -> [String : Any] {
        var params = super.toParams()
        params["idCompany"]         = idCompany.encrypt()
        params["idService"]         = idService.encrypt()
        params["serviceIdentifier"] = serviceIdentifier.encrypt()
        return params
    }
}

class RequestConsultarServicios : Request {
    
    override func toParams() -> [String : Any] {
        return super.toParams()
    }
}
