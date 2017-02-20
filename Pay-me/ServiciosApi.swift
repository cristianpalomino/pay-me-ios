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
    
    class func apiAgregarServicio(params :[String : Any], completion: @escaping RequestUtil.Completion) {
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
                                        let paymeData = ResponseAgregarServicio(json: json)
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
    
    class func apiConsultarPagos(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.CONSULTAR_PAGOS,
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
                                        let paymeData = ResponseConsultarPagos(json: json)
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
    
    class func apiConsultarAgenda(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.CONSULTAR_AGENDA,
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
                                        let paymeData = ResponseConsultarAgenda(json: json)
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
    
    class func apiConsultarDeudas(request :RequestConsultarDeudas, completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.CONSULTAR_DEUDAS,
                          method : .post,
                          parameters: request.toParams(),
                          encoding: JSONEncoding.default).responseJSON {
                            response in
                            switch response.result {
                            case .success:
                                if let value = response.result.value {
                                    let json = JSON(value)
                                    let rc = json[Constants.Api.Json.kAnswerCode].stringValue.decrypt()
                                    if rc == Constants.Api.kSuccessCode {
                                        let paymeData = ResponseConsultarDeudas(json: json)
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
    
    class func apiConsultarNotificaciones(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.CONSULTAR_NOTIFICACIONES,
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
                                        let paymeData = ResponseConsultarNotificaciones(json: json)
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
    
    class func apiConsultarServicios(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.CONSULTAR_SERVICIOS,
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
                                        let paymeData = ResponseConsultarServicios(json: json)
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
    
    
    class func apiEliminarNotificacion(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.ELIMINAR_NOTIFICACION,
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
                                        let paymeData = ResponseEliminarNotificacion(json: json)
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
    
    
    class func apiPagarServicio(params :[String : Any], completion: @escaping RequestUtil.Completion) {
        Alamofire.request(Constants.Api.URLs.EndPoints.PAGAR_SERVICIO,
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
                                        let paymeData = ResponsePagarServicio(json: json)
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
