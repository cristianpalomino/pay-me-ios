//
//  ServiciosApi.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiciosApi {
    
    class func requestAgregarServicio(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.AGREGAR_SERVICIO,
                          method : .post,
                          parameters: params,
                          encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    let rc = json[Constants.Api.Json.kAnswerCode].stringValue
                    
                    if rc == Constants.Api.kSuccessCode {
                        
                        let paymeData = AgregarServicio(json: json)
                        completion(PaymeApiResult(data: paymeData, error: nil))
                    } else {
                        
                        let paymeError = PaymeError(json: json)
                        completion(PaymeApiResult(data: nil, error: paymeError))
                    }
                }
                else {
                    
                    completion(PaymeApiResult(data: nil, error: PaymeError()))
                }
            case .failure(let error):
                
                let paymeError = PaymeError(message: error.localizedDescription)
                completion(PaymeApiResult(data: nil, error: paymeError))
            }
        }

    }
}
