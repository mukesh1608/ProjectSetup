//
//  ApiError.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This have all the keys which has to passed in Api Errors.
///

/// - Unauthorized : Unauthorized errors
/// - InvalidURLResponse  : InvalidURLResponse errors
/// - HttpError : HttpError errors
/// - HttpRequestError : HttpRequestError errors
/// - DataParsingError : DataParsingError errors
/// - DataNotAvailable : DataNotAvailable errors
/// - ResultStatusError : ResultStatusError errors

enum ApiError: Error {
    case Unauthorized
    case InvalidURLResponse
    case HttpError(statusCode: Int)
    case HttpRequestError
    case DataParsingError
    case DataNotAvailable
    case ResultStatusError
}
