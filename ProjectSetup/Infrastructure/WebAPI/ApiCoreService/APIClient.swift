//
//  APIClient.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation
import Alamofire

typealias APIClientResultCallback = ((_ result: ApiResponseModel?, _ error: ErrorModel?) -> Void)


/// This class is used for networking.
class APIClient {
    
    //MARK:- Vars
    
    /// API Base URL
    private let baseUrl = ""


    //MARK:- Complete URL for API
    /// Complete URL for API
    /// - Parameter endPoint: Passing end point
    /// - Returns: Complete URL
    private func getCompleteUrlPath(endPoint: String) -> String {
        return baseUrl.appending(endPoint);
    }
    

    //MARK:- HTTP Headers
    
    /// This function is used for Http headers.
    /// - Returns: Http headers
    private func getHTTPHeaders<T: Encodable>(extraHeaders: [String: String]? = nil,requestModel: ApiRequestModel<T>) -> [String:String] {
        var headers = APIConstants().defaultHeaders

        //Append Extra-Headers
        if let extra = extraHeaders {
            extra.forEach { (key, value) in
                headers[key] = value;
            }
        }
//
//        if let accessToken = Authorization.shared.getAuthorization() {
//            headers[Constants.ApiKeys.Authorization] = "Bearer \(accessToken)";
//        }
        
        return headers;
    }
    
    
    //MARK:- Perform HTTP Request
    func httpRequest<T: Encodable>(requestModel: ApiRequestModel<T>, completion: @escaping APIClientResultCallback)  {
        
        //URL Path string
        let url = getCompleteUrlPath(endPoint: requestModel.endPoint);
        
        //HTTP Headers
        let headers = getHTTPHeaders(extraHeaders: requestModel.headers, requestModel: requestModel);
        let httpHeaders = HTTPHeaders(headers);
        
        //HTTP Method
        let method = requestModel.method;
        let httpMethod = HTTPMethod(rawValue: method.rawValue);

        
        //Parameters
        let parameter = requestModel.params;
        
        //Encoding
        var encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default;
        if method == .POST || method == .PUT {
            encoder = JSONParameterEncoder.prettyPrinted;
        }
        
        //Log Request details
//        printLOG("Request URL:: \(method.rawValue): \(url)");
//        printLOG("Request Headers:: \(headers)");
//        printLOG("HTTP Body:: \(requestModel.params)");
        
        //Make Request
        if let json = requestModel.jsonParam {
            let request = AF.request(url,
            method: httpMethod,
            parameters: json,
            encoding: JSONEncoding.default,
                headers: httpHeaders);
            request.validate().responseJSON { (response) in
               let (result, error) = self.processResponse(response: response);
                completion(result, error);
            }
        }else{
            let request = AF.request(url,
                                     method: httpMethod,
                                     parameters: parameter,
                                     encoder: encoder,
                                     headers: httpHeaders);
            request.validate().responseJSON { (response) in
                
                let (result, error) = self.processResponse(response: response);
                completion(result, error);
            }
        }
    }
    
    
    //MARK:- Parse Response Data Result from API
    private func processResponse(response: AFDataResponse<Any>) -> (result: ApiResponseModel?, error: ErrorModel?) {
//        printLOG("RESPONSE for \(String(describing: response.request))");
//        printLOG("RESULT:\n \(response.result)")
        
        //Check URLResponse exist
        guard let urlResponse = response.response else {
            let error = ErrorModel(code: ErrorCode.InvalidResponse,
                                   message: StringConstant.serverMsg.InvalidData);
            
            return (nil, error);
        }
        
        //Status Code
        let statusCode = urlResponse.statusCode;
        
        guard statusCode == HTTPStatus.OK.rawValue else {
            guard statusCode == HTTPStatus.UnAuthorized.rawValue  else {
                // TODO: fetched error response from data.
                guard let data = response.data else {
                    let error = ErrorModel(code: ErrorCode.HttpError,
                                           message: StringConstant.serverMsg.HttpErrorMessage + "\(statusCode)");
                    return (nil, error);
                }
                let errorResponse = self.getErrorResponseModel(data: data)
                if let response = errorResponse {
                    let error = ErrorModel(code: ErrorCode.HttpError,
                                           message: response.error);
                    return (nil, error);
                }else{
                    let error = ErrorModel(code: ErrorCode.HttpError,
                                           message: StringConstant.serverMsg.HttpErrorMessage + "\(statusCode)");
                    return (nil, error);
                }
            }
            let error = ErrorModel(code: ErrorCode.UnAuthorized,
                                   message: "Invalid Token.");
            return (nil, error);
        }
        
        
        //For HTTPStatus = 200
        
        switch response.result {
        case .success(let result):
            if let resultData = result as? JSONObject {
                let model = ApiResponseModel(json: resultData);
                return (model, nil);
            } else {
                //Error
                let error = ErrorModel(code: ErrorCode.DataParsingError,
                                       message: StringConstant.serverMsg.DataNotAvailable);
                return (nil, error);
            }
                        
        case .failure(let error):
            
            let error = ErrorModel(code: .HttpError,
                                   message: "Error in performing request: \n \(error)");
            return (nil, error);
        }
        
    }
    
    func getErrorResponseModel(data:Data) -> ApiErrorResponseModel?  {
        do {
            let decoder = JSONDecoder();
            let model = try decoder.decode(ApiErrorResponseModel.self, from: data);
            
            return model;
            
        } catch {
            printLOG("ERROR: \(error)");
        }
        return nil
    }
}
