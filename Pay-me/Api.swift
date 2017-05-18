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

struct PaymeApi {
    
    public static let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
}

struct Request {
    
    static func getFavoritos(completionHandler: @escaping (ResponseHandlerFavoritos) -> Void, errorHandler: @escaping (ErrorHandler) -> Void) {
        PaymeApi.sessionManager.request(ServiciosRouter.list).responseJSON(completionHandler: {
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
                
            case .failure(let error):
                errorHandler(error)
            }
        })
    }
    
    static func debtConsult(identifier: String, completionHandler: @escaping (ResponseHandlerDebtConsult) -> Void, errorHandler: @escaping (ErrorHandler) -> Void) {
        PaymeApi.sessionManager.request(ServiciosRouter.consult(identifier: identifier)).responseJSON {
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
                
            case .failure(let error):
                errorHandler(error)
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
                
                completionHandler()
                
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}

