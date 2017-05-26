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
    case errorCode(reason: String)
    case notAnswerCode(reason: String)
}

protocol JSONObjectSerializable {
    
    init?(json: JSON)
}

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

struct PaymeService {
    
    static func getFavoritos(completion: @escaping (Result<[Favorito]>) -> Void) {
        PaymeApi.sessionManager.request(Router.list).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                
                guard let answerCode = json["answerCode"].string else {
                    let reason = "No 'answerCode'"
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard answerCode.decrypt() == "000" else {
                    let reason = json["answerMessage"].stringValue.decrypt()
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard let array = json["services"].array else {
                    if let favorito = Favorito(json: json["services"]) {
                        completion(Result.success([favorito]))
                    }
                    return
                }
                
                var favoritos = [Favorito]()
                array.forEach {
                    if let favorito = Favorito(json: $0) {
                        favoritos.append(favorito)
                    }
                }
                completion(Result.success(favoritos))
                
            case .failure(let error):
                completion(Result.failure(error))
            }
        })
    }
    
    static func debtConsult(identifier: String, completion: @escaping (Result<(name: String, services: [Service])>) -> Void) {
        PaymeApi.sessionManager.request(Router.consult(identifier: identifier)).responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                guard let answerCode = json["answerCode"].string else {
                    let reason = "No 'answerCode'"
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard answerCode.decrypt() == "000" else {
                    let reason = json["answerMessage"].stringValue.decrypt()
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard let name = json["clientName"].string else {
                    return
                }
                
                guard let array = json["services"].array else {
                    if let service = Service(json: json["services"]) {
                        completion(Result.success((name, [service])))
                        return
                    }
                    
                    completion(Result.success((name, [])))
                    return
                }
                
                var servicios = [Service]()
                array.forEach {
                    if let servicio = Service(json: $0) {
                        servicios.append(servicio)
                    }
                }
                
                completion(Result.success((name, servicios)))
                
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    static func getReceipts(favorito: Favorito, completion: @escaping (Result<(name: String, services: [Service])>) -> Void) {
        PaymeApi.sessionManager.request(Router.listReceipts(favorito: favorito)).responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                guard let answerCode = json["answerCode"].string else {
                    let reason = "No 'answerCode'"
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard answerCode.decrypt() == "000" else {
                    let reason = json["answerMessage"].stringValue.decrypt()
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard let name = json["clientName"].string else {
                    return
                }
                
                guard let array = json["services"].array else {
                    if let service = Service(json: json["services"]) {
                        completion(Result.success((name, [service])))
                        return
                    }
                    
                    completion(Result.success((name, [])))
                    return
                }
                
                var servicios = [Service]()
                array.forEach {
                    if let servicio = Service(json: $0) {
                        servicios.append(servicio)
                    }
                }
                
                completion(Result.success((name, servicios)))
                
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    static func addServices(services: [Service], owner: String, identifier: String, completion: @escaping (Result<Void>) -> Void) {
        PaymeApi.sessionManager.request(Router.add(services: services, owner: owner, identifier: identifier)).responseJSON {
            response in
           
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                guard let answerCode = json["answerCode"].string else {
                    let reason = "No 'answerCode'"
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                guard answerCode.decrypt() == "000" else {
                    let reason = json["answerMessage"].stringValue.decrypt()
                    completion(Result.failure(BackendError.notAnswerCode(reason: reason)))
                    return
                }
                
                completion(Result.success())
                
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}

