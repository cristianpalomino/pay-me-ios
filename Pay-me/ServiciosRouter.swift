//
//  ServiciosRouter.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import Alamofire


enum ServiciosRouter: URLRequestConvertible {
    
    case consult(String)
    case add([Service])
    
    var path: String {
        switch self {
        case .consult:
            return Constants.Api.URLs.EndPoints.CONSULTAR_DEUDAS
        case .add:
            return Constants.Api.URLs.EndPoints.AGREGAR_SERVICIO
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .consult, .add:
            return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.Api.URLs.BASE_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .consult(let identifier):
            
            let current = Session.sharedInstance.current
            staticParams["idCompany"] = current.item!.idCompany.encrypt()
            staticParams["idServiceSPS"] = current.item!.idServiceSPS.encrypt()
            staticParams["serviceIdentifier"] = identifier.encrypt()
            staticParams["typeOperation"] = "1"
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: staticParams)
            
        case .add(let services):
            
            var params = ["requestService": [Any]()]
            services.forEach {
                i in
                let service = ["owner": Session.sharedInstance.current.addService.userName,
                            "idCompanySPS": Session.sharedInstance.current.item!.idCompany,
                            "idServiceSPS": i.idServiceSPS,
                            "alias": i.nameService,
                            "serviceIdentifier": Session.sharedInstance.current.addService.identifier]
                let item = ["service": service,
                            "idCardholder": Constants.Debug.ID_CARDHOLDER.encrypt(),
                            "idCommerce": Constants.Debug.ID_COMERCIO,
                            "macAddress": Constants.Debug.MAC_ADDRESS.encrypt()] as [String : Any]
                params["requestService"]!.append(item)
            }
            
            print(params)
            
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: staticParams)
        }
        
        return urlRequest
    }
}
