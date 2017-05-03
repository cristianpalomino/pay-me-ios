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

protocol ResponseObjectSerializable {
    init?(response: HTTPURLResponse, json: JSON)
}

protocol ResponseCollectionSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation json: [JSON]) -> [Self]
}

extension ResponseCollectionSerializable where Self: ResponseObjectSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation json: [JSON]) -> [Self] {
        var collection: [Self] = []
        
        for itemRepresentation in json {
            if let item = Self(response: response, json: itemRepresentation) {
                collection.append(item)
            }
        }
        return collection
    }
}

extension DataRequest {
    
    @discardableResult
    func responseCollection<T: ResponseCollectionSerializable>(
        queue: DispatchQueue? = nil,
        key: String? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            guard let response = response else {
                let reason = "Response collection could not be serialized due to nil response."
                return .failure(BackendError.objectSerialization(reason: reason))
            }
            
            let json = JSON(jsonObject)
            
            guard let key = key else {
                return .success(T.collection(from: response, withRepresentation: json.arrayValue))
            }
            
            guard let jsonArray = json[key].array else {
                let reason = "JsonArray not found"
                return .failure(BackendError.objectSerialization(reason: reason))
            }
            
            return .success(T.collection(from: response, withRepresentation: jsonArray))
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
    
    static func getFavoritos(completionHandler: @escaping (DataResponse<[Favorito]>) -> Void) {
        PaymeApi.sessionManager.request(FavoritosRouter.list).responseCollection(key: "services") {
            (response: DataResponse<[Favorito]>) in
            completionHandler(response)
        }
    }
}

enum FavoritosRouter: URLRequestConvertible {
    
    case list
    
    var path: String {
        switch self {
        case .list:
            return Constants.Api.URLs.EndPoints.CONSULTAR_SERVICIOS
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.Api.URLs.BASE_URL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .list:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: staticParams)
        }
        
        return urlRequest
    }
}
