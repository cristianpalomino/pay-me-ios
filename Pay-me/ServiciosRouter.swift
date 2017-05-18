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
    
    case list
    case consult(identifier: String)
    case add(services: [Service], owner: String, identifier: String)
    
    var path: String {
        switch self {
        case .list:
            return Constants.Api.URLs.EndPoints.CONSULTAR_SERVICIOS
        case .consult:
            return Constants.Api.URLs.EndPoints.CONSULTAR_DEUDAS
        case .add:
            return Constants.Api.URLs.EndPoints.AGREGAR_SERVICIO
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .consult, .add, .list:
            return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.Api.URLs.BASE_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .list:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .consult:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        case .add:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
    
    var params: Parameters {
        let current = Session.sharedInstance.current
        switch self {
        case .list:
            let localparams = [
                            "idCardholder" : Constants.Debug.ID_CARDHOLDER.encrypt(),
                            "idCommerce" : Constants.Debug.ID_COMERCIO,
                            "macAddress" : Constants.Debug.MAC_ADDRESS.encrypt(),
                            ]
            return localparams
            
        case .consult(let identifier):
            let localparams = [
                            "idCardholder" : Constants.Debug.ID_CARDHOLDER.encrypt(),
                            "idCommerce" : Constants.Debug.ID_COMERCIO,
                            "macAddress" : Constants.Debug.MAC_ADDRESS.encrypt(),
                            "idCompany" : current.item!.idCompany.encrypt(),
                            "idServiceSPS" : current.item!.idServiceSPS.encrypt(),
                            "serviceIdentifier" : identifier.encrypt(),
                            "typeOperation" : "1"
                            ]
            return localparams
            
        case .add(let services, let owner, let identifier):
                var localparams = ["requestService" : [Any]()]
                services.forEach {
                i in
                    
                    let service = [
                                "owner" : owner,
                                "idCompanySPS" : current.item!.idCompany,
                                "idServiceSPS" : i.idServiceSPS,
                                "alias" : i.nameService,
                                "serviceIdentifier" : identifier
                                ]
            
                    let item = [
                                "service" : service,
                                "idCardholder" : Constants.Debug.ID_CARDHOLDER.encrypt(),
                                "idCommerce" : Constants.Debug.ID_COMERCIO,
                                "macAddress" : Constants.Debug.MAC_ADDRESS.encrypt()
                                ] as [String : Any]
                    localparams["requestService"]!.append(item)
                    
                }
                
            return localparams
        }
    }
}
