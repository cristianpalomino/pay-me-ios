//
//  ServiciosRouter.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import Alamofire


enum Router: URLRequestConvertible {
    
    case list
    case consult(identifier: String)
    case listReceipts(favorito: Favorito)
    case add(services: [Service], owner: String, identifier: String)
    
    var path: String {
        switch self {
        case .list:
            return Constants.Api.URLs.EndPoints.CONSULTAR_SERVICIOS
        case .consult:
            return Constants.Api.URLs.EndPoints.CONSULTAR_DEUDAS
        case .listReceipts:
            return Constants.Api.URLs.EndPoints.CONSULTAR_DEUDAS
        case .add:
            return Constants.Api.URLs.EndPoints.AGREGAR_SERVICIO
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .consult, .add, .list, .listReceipts:
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
        case .listReceipts:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
    
    var params: Parameters {
        
        var parameters: Parameters = [:]
        
        switch self {
        case .list:
            
            parameters["idCardholder"] = Constants.Debug.ID_CARDHOLDER.encrypt()
            parameters["idCommerce"] = Constants.Debug.ID_COMERCIO
            parameters["macAddress"] = Constants.Debug.MAC_ADDRESS.encrypt()
            
        case .consult(let identifier):
            
            let current = Session.shared.current
            parameters["idCardholder"] = Constants.Debug.ID_CARDHOLDER.encrypt()
            parameters["idCommerce"] = Constants.Debug.ID_COMERCIO
            parameters["macAddress"] = Constants.Debug.MAC_ADDRESS.encrypt()
            parameters["idCompany"] = current.item!.idCompany.encrypt()
            parameters["idServiceSPS"] = current.item!.idServiceSPS.encrypt()
            parameters["serviceIdentifier"] = identifier.encrypt()
            parameters["typeOperation"] = "1"
            
        case .listReceipts(let favorito):
            
            parameters["idCardholder"] = Constants.Debug.ID_CARDHOLDER.encrypt()
            parameters["idCommerce"] = Constants.Debug.ID_COMERCIO
            parameters["macAddress"] = Constants.Debug.MAC_ADDRESS.encrypt()
            parameters["idCompany"] = favorito.idCompanySPS.encrypt()
            parameters["idServiceSPS"] = favorito.idServiceSPS.encrypt()
            parameters["serviceIdentifier"] = favorito.serviceIdentifier.encrypt()
            parameters["typeOperation"] = "2"
            
        case .add(let services, let owner, let identifier):
            let current = Session.shared.current
            var items = [Any]()
            services.forEach { i in
                let service = [
                    "owner" : owner,
                    "idCompanySPS" : current.item!.idCompany,
                    "idServiceSPS" : i.idServiceSPS,
                    "alias" : i.nameService,
                    "serviceIdentifier" : identifier]
            
                let item = [
                    "service" : service,
                    "idCardholder" : Constants.Debug.ID_CARDHOLDER.encrypt(),
                    "idCommerce" : Constants.Debug.ID_COMERCIO,
                    "macAddress" : Constants.Debug.MAC_ADDRESS.encrypt()
                    ] as [String : Any]
                
                items.append(item)
            }
            
            parameters["requestService"] = items
        }
        
        return parameters
    }
}
