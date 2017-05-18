//
//  Api.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 02/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var staticParams: Parameters = ["idCardholder" : Constants.Debug.ID_CARDHOLDER.encrypt(),
                                "idCommerce" : Constants.Debug.ID_COMERCIO,
                                "macAddress" : Constants.Debug.MAC_ADDRESS.encrypt()]

enum BackendError: Error {
    
    case network(error: Error)
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case objectSerialization(reason: String)
    case notAnswerCode(reason: String)
    case errorCode(reaseon: String)
}

protocol JSONObjectSerializable {
    
    init?(json: JSON)
}

typealias ErrorHandler = Error
typealias SuccessHandler = ()
typealias ResponseHandlerFavoritos = [Favorito]
typealias ResponseHandlerDebtConsult = (name: String, services: [Service])

extension DataRequest {
    
    @discardableResult
    func responsePMJSON (
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<JSON>) -> Void) -> Self {

        let responseSerializer = DataResponseSerializer<JSON> { request, response, data, error in
            
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            guard let _ = response else {
                let reason = "Response collection could not be serialized due to nil response."
                return .failure(BackendError.objectSerialization(reason: reason))
            }
            
            let json = JSON(jsonObject)
            guard let code = json["answerCode"].string
            else {
                let reason = "NO CODE"
                return .failure(BackendError.objectSerialization(reason: reason))
            }
            
            if code == "999" {
                let reason = json["answerMessage"].stringValue
                return .failure(BackendError.objectSerialization(reason: reason))
            } else {
                return .success(json)
            }
            
            let reason = "NO RESPONSE"
            return .failure(BackendError.objectSerialization(reason: reason))
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}

struct PaymeApi {
    
    public static let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 40
        configuration.timeoutIntervalForResource = 40
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
}

struct Request {
    
    static func getFavoritos(completionHandler: @escaping (ResponseHandlerFavoritos) -> Void, errorHandler: @escaping (ErrorHandler) -> Void) {
        PaymeApi.sessionManager.request(FavoritosRouter.list).responsePMJSON(completionHandler: {
            response in
            
            guard let json = response.result.value else {
                if let error = response.error {
                    errorHandler(error)
                }
                return
            }
            
            guard let array = json["services"].array else {
                if let favorito = Favorito(json: json["services"]) {
                    completionHandler([favorito])
                }
                return
            }
            
            var favoritos = [Favorito]()
            array.forEach {
                if let favorito = Favorito(json: $0) {
                    favoritos.append(favorito)
                }
            }
            
            completionHandler(favoritos)
        })
    }
    
    static func debtConsult(identifier: String, completionHandler: @escaping (ResponseHandlerDebtConsult) -> Void, errorHandler: @escaping (ErrorHandler) -> Void) {
        PaymeApi.sessionManager.request(ServiciosRouter.consult(identifier: identifier)).responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                guard let name = json["clientName"].string else {
                    return
                }
                
                guard let array = json["services"].array else {
                    if let service = Service(json: json["services"]) {
                        completionHandler(ResponseHandlerDebtConsult(name, [service]))
                        return
                    }
                    
                    completionHandler(ResponseHandlerDebtConsult(name, []))
                    return
                }
                
                var servicios = [Service]()
                array.forEach {
                    if let servicio = Service(json: $0) {
                        servicios.append(servicio)
                    }
                }
                
                completionHandler(ResponseHandlerDebtConsult(name, servicios))
                
                break
            case .failure(let error):
                errorHandler(error)
                break
            }
        }
    }
    
    static func addServices(services: [Service], owner: String, identifier: String, completionHandler: @escaping (SuccessHandler) -> Void, errorHandler: @escaping (ErrorHandler) -> Void) {
        PaymeApi.sessionManager.request(ServiciosRouter.add(services: services, owner: owner, identifier: identifier)).responseJSON {
            response in
           
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                guard let answerCode = json["answerCode"].string else {
                    let reason = "No 'answerCode'"
                    errorHandler(BackendError.notAnswerCode(reason: reason))
                    return
                }
                
                guard answerCode.decrypt() == "000" else {
                    let reason = json["answerMessage"].stringValue.decrypt()
                    errorHandler(BackendError.errorCode(reaseon: reason))
                    return
                }
                
                print(answerCode.decrypt())
                print(json["answerMessage"].stringValue.decrypt())
                completionHandler()
                
                break
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}

