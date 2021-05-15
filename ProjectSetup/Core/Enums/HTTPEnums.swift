//
//  HTTPEnums.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This have all the keys which has to passed in Api HTTP Method.
///

/// - GET : GET method
/// - POST  : POST method
/// - PUT : PUT method
enum ApiHTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

/// This have all the keys which has to passed in Api HTTP Status.
///

/// - OK : OK code
/// - InternalServerError  : InternalServerError code
/// - BadRequest : BadRequest code
/// - UnAuthorized : UnAuthorized code
/// - InvalidToken : InvalidToken code
enum HTTPStatus: Int {
    case OK = 200
    case InternalServerError = 500
    case BadRequest = 400
    case UnAuthorized = 401
    case InvalidToken = 403

}

/// This have all the keys which has to passed in Message Type.
///

/// - success : success
/// - warning  : warning
/// - error : error
enum MessageType: Int {
    case success = 0;
    case warning = 2;
    case error = 3
}
