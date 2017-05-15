//
//  FavoritosRouter.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Alamofire
import Foundation

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
