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
}

protocol JSONObjectSerializable {
    
    init?(json: JSON)
}

typealias FinishHandler = Void
typealias ErrorHandler = Error
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
    
    static func getFavoritos(completionHandler: @escaping (ResponseHandlerFavoritos) -> Void,
                             errorHandler: @escaping (ErrorHandler) -> Void,
                             finishHandler: @escaping (FinishHandler) -> Void) {
        PaymeApi.sessionManager.request(FavoritosRouter.list).responsePMJSON(completionHandler: {
            response in
            
            finishHandler()
            
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
    
    static func debtConsult(completionHandler: @escaping (ResponseHandlerDebtConsult) -> Void,
                            errorHandler: @escaping (ErrorHandler) -> Void,
                            finishHandler: @escaping (FinishHandler) -> Void) {
        
        if let identifier = Session.sharedInstance.current.addService.identifier {
            PaymeApi.sessionManager.request(ServiciosRouter.consult(identifier)).responsePMJSON {
                response in
                
                finishHandler()
                
                guard let json = response.result.value else {
                    if let error = response.error {
                        errorHandler(error)
                    }
                    return
                }
                
                guard let name = json["clientName"].string else {
                    return
                }
                
                guard let array = json["services"].array else {
                    if let service = Service(json: json["services"]) {
                        completionHandler(ResponseHandlerDebtConsult(name, [service]))
                    }
                    return
                }
                
                var servicios = [Service]()
                array.forEach {
                    if let servicio = Service(json: $0) {
                        servicios.append(servicio)
                    }
                }
                
                completionHandler(ResponseHandlerDebtConsult(name, servicios))
            }
        }
    }
}

