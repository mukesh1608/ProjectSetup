//
//  BaseApiService.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

/// This class is used for calling the api's.
class BaseApiService<T: Encodable, U: Decodable> {
    
    //MARK:- Vars
    private var headers = [String: String]();
    
    let client = APIClient();
    var showProgress = true;
    var response: ApiResponseModel? = nil;
    var errorResult: ErrorModel? = nil;
    
    
    //MARK:- Result completion callback
    var onSuccess: ((U) -> Void) = { (u: U) in
        printLOG("RESULT:: Must be implement with service class");
    }
    
    var onSuccessJSON: ((JSONObject) -> Void) = { (u: JSONObject) in
        printLOG("RESULT:: Must be implement with service class");
    }
    
    var onFailure: ((ErrorModel) -> Void) = { (error: ErrorModel) in
        printLOG("ERROR:: Must be implemented with Service class");
    }
    
    
    //Add value in headers
    func addHeader(key: String, value: String) {
        headers[key] = value;
    }
    
    //MARK: Loading Message
    open var progressMessage = "Please wait...";
    
    
    //MARK: HTTP parameters
    open func endPoint() -> String {
        fatalError("Must be provided in SubClass");
    }
    
    //open var httpMethod: ApiHTTPMethod = .GET;
    open func httpMethod() -> ApiHTTPMethod {
        fatalError("Must be provided in SubClass");
    }
    
    open func getRequestParams() -> T? {
        return nil;
    }
    
    open func getRequestJSON() -> JSONObject? {
        return nil
    }
    
    //MARK:- Send Request
    open func request() {
        if endPoint().contains(APIEndPoint.ShareCode.ShareCode) && getRequestParams() != nil {
            sendRequest {
                if let res = self.covertToJSON() {
                    self.onSuccessJSON(res);
                } else {
                    self.failureCallback();
                }
            }
        }
        if getRequestJSON() != nil {
            sendRequest {
                if let res = self.covertToJSON() {
                    self.onSuccessJSON(res);
                } else {
                    self.failureCallback();
                }
            }
        }
        else {
            sendRequest {
                if let res = self.convertToModel() {
                    self.onSuccess(res);
                } else {
                    self.failureCallback();
                }
            }
        }
    }
    
    
    //MARK: Parse Response Result
    open func convertToModel() -> U? {
        return nil;
    }
    
    open func covertToJSON() -> JSONObject? {
        return nil;
    }
    
    
    //MARK:- Perform HTTP Request
    private func sendRequest(completion: @escaping () -> Void) {
        
        // Check network connectivity
        guard Reachability.shared.isConnectedToNetwork() else {
            MessageAlert.showInfoAlert(title: StringConstant.serverMsg.ApiErrorTitle, message: StringConstant.serverMsg.InternetConnection)
            return;
        }
        
        
        //Display progress Load if enabled
        if showProgress {
            //ToDo: Loader
            Loader.shared.show();
        }
        
        
        //Params
        let params = getRequestParams();
        
        let json = getRequestJSON();
        
        //Request Model
        var model = ApiRequestModel(endPoint: endPoint(),
                                    method: httpMethod(),
                                    headers: headers,
                                    params: params);
        
        model.jsonParam = json;
        
        //Send Request
        errorResult = nil;
        response = nil;
        client.httpRequest(requestModel: model) { (resultModel, errorModel) in
            
            //Stop Progress
            
            //If error
            if let err = errorModel {
                if self.showProgress {
                    //Stop Progress
                    Loader.shared.hideWithError();
                }
                self.errorResult = err;
                //Failure Callback
                self.failureCallback();
                return;
            }
            
            //Result mode
            if let res = resultModel {
                if self.showProgress {
                    //Stop Progress
                    Loader.shared.hideWithSuccess();
                }
                self.response = res;
                completion();
            } else {
                if self.showProgress {
                    //Stop Progress
                    Loader.shared.hideWithError();
                }
                
                //Error
                self.errorResult = ErrorModel(code: .DataNotAvailable,
                                              message: StringConstant.serverMsg.DataNotAvailable);
                //Failure Callback
                self.failureCallback();
            }
        }
        
    }
    
    
    private func failureCallback() {
        
        guard let errModel = errorResult else {
            return
        }
        onFailure(errModel);
    }
}
