//
//  ErrorCodes.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This have all the keys which has to passed in Error Code.
///

/// - InvalidResponse : InvalidResponse errors
/// - HttpError  : HttpError errors
/// - DataParsingError : DataParsingError errors
/// - DataNotAvailable : DataNotAvailable errors
/// - ApiResultStatusError : ApiResultStatusError errors
/// - UIValidationError : UIValidationError errors
/// - UnAuthorized : UnAuthorized errors

enum ErrorCode: Int {
    case InvalidResponse        =   -1000
    case HttpError              =   -2000
    case DataParsingError       =   -3000
    case DataNotAvailable       =   -3001
    case ApiResultStatusError   =   -4000
    
    case UIValidationError      =   -5000
    case UnAuthorized           =    401

}
