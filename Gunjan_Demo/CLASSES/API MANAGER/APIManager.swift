//
//  APIManager.swift
//

import Foundation
import Alamofire
import SwiftyJSON

//MARK: - BASE URL -


let IMAGE_URL                      =   FinalURL

let FinalURL = "https://www..com/"


let MAIN_URL  =   "\(FinalURL)api/v1/"
let BASE_URL                      =   "\(MAIN_URL)"
let BASE_URL_SUBENDPOINT              =   "\(MAIN_URL)any/"

class APIManager {

    class func callAPIGetRequest(Method method:HTTPMethod,url:String,parameters:Parameters?,headers:HTTPHeaders?,showAlert:Bool, withloader : Bool,viewContoller :UIViewController,completion:  @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void)
    {
        logD("Request Data URL:\(url)\nParams:\(String(describing: parameters))\nHeaders:\(String(describing: headers))")
        if withloader{
            Utils.showLoading(title: "Please Wait..")
        }
        
        AF.request(url,method: method,encoding: JSONEncoding.default,headers: headers).validate().responseJSON{ (response) in
            Utils.hideLoading()
            switch response.result {
                case .success:
                    logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")
                    let responseJSON = JSON(Utils.jsonFromData(data: response.data!))
                    completion(responseJSON,responseJSON["message"].stringValue)
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        //timeout here
                    }
                    printLog(msg:"\n\nrequest with error:\n \(error)")
                    var message = error.localizedDescription
                    /*if !showAlert {
                     failure(response.response, message)
                     return
                     }*/
                    if response.response != nil {
                        //In case  of responsemessage in body
                        //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                        if let json = dataToJSON(data: response.data!) {
                            message = JSON(json)["message"].stringValue
                        }
                    }
                    else {
                        if showAlert {
                            
//                            let _ = UIAlertController(title: "", message: message)
                        }
                    }
                    failure(response.response, message)
            }
        }
    }
    class func callAPIRequest(Method method:HTTPMethod,url:String,parameters:Parameters?,headers:HTTPHeaders?,showAlert:Bool, withloader : Bool,viewContoller : UIViewController ,completion:  @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void)
    {
        logD("Request Data URL:\(url)\nParams:\(String(describing: parameters))\nHeaders:\(String(describing: headers))")
        if withloader{
            Utils.showLoading(title: "Please Wait..")
        }
        
        AF.request(url,method: method,parameters: parameters == nil ? [:] : parameters!,encoding: JSONEncoding.default,headers: headers).validate().responseJSON{ (response) in
            printLog(msg: response)
            Utils.hideLoading()
            switch response.result {
                case .success:
                    logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")

                    let responseJSON = JSON(Utils.jsonFromData(data: response.data!))

                    if responseJSON["code"] == 0 {
                        Utils.showAlert(targetVC: viewContoller, title: "Alert", message: responseJSON["message"].stringValue , style: .alert)
                        return;
                    }
                    completion(responseJSON,responseJSON["message"].stringValue)

                case .failure(let error):

                    if error._code == NSURLErrorTimedOut {
                        //timeout here
                    }
                    printLog(msg:"\n\nrequest with error:\n \(error)")
                    var message = error.localizedDescription
                    /*if !showAlert {
                     failure(response.response, message)
                     return
                     }*/
                    if response.response != nil {
                        //In case  of responsemessage in body
                        //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                        if let json = dataToJSON(data: response.data!) {
                            message = JSON(json)["message"].stringValue
                        }
                    }
                    else {
                        if showAlert {
                            Utils.showAlert(targetVC: viewContoller, title: "Alert", message: message, style: .alert)
                        }
                    }
                    failure(response.response, message)
            }
        }
    }

    class func JSONAPIRequest(method:HTTPMethod,url:String,keydata : [[String:Any]] ,parameters:Parameters?,headers:HTTPHeaders?,showAlert:Bool, withloader : Bool,viewContoller : UIViewController ,completion:  @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void)
    {
        Utils.showLoading(title: "Please Wait..")

        let data = try! JSONSerialization.data(withJSONObject: keydata, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonBatch : String = String(data: data, encoding: .utf8)!
        let objData = Utils.jsonObject(jsonString: jsonBatch)

        let param : [String : Any] = [
            :]

        let ulr =  NSURL(string:url as String)
        var request = URLRequest(url: ulr! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //            request.setValue(AppUtilities.shared.Token!, forHTTPHeaderField: CS.Params.access_token)
        //            request.setValue(AppUtilities.shared.Token!, forHTTPHeaderField: CS.Params.access_token_prm)
        //            request.setValue(AppUtilities.shared.Token!, forHTTPHeaderField: CS.Params.Token)


        let data1 = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)

        let json = NSString(data: data1, encoding: String.Encoding.utf8.rawValue)
        if let json = json {
            printLog(msg:json)
            request.httpBody = json.data(using: String.Encoding.utf8.rawValue);
        }else{
            Utils.showAlert(targetVC: viewContoller, title: "Alert", message: CS.Common.wrongMsg , style: .alert)
            return;
        }


        AF.request(request).responseJSON { (response) in
            Utils.hideLoading()
            switch response.result {
                case .success:
                    logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")

                    let responseJSON = JSON(Utils.jsonFromData(data: response.data!))

                    if responseJSON["code"] == 0 {
                        Utils.showAlert(targetVC: viewContoller, title: "Alert", message: responseJSON["message"].stringValue, style: .alert)
                        //                                Utils.showLoginAlert(targetVC: viewContoller, title: "Alert", message: responseJSON["message"].stringValue , style: .alert)
                        return;
                    }

                    completion(responseJSON,responseJSON["message"].stringValue)


                case .failure(let error):

                    if error._code == NSURLErrorTimedOut {
                        //timeout here
                    }
                    printLog(msg:"\n\nrequest with error:\n \(error)")
                    var message = error.localizedDescription
                    /*if !showAlert {
                     failure(response.response, message)
                     return
                     }*/
                    if response.response != nil {
                        //In case  of responsemessage in body
                        //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                        if let json = dataToJSON(data: response.data!) {
                            message = JSON(json)["message"].stringValue
                        }
                    }
                    else {
                        if showAlert {
                            Utils.showAlert(targetVC: viewContoller, title: "Alert", message: message, style: .alert)
                        }
                    }
                    failure(response.response, message)
            }
        }
    }
    
    //MARK:- Upload  Multiple Images

    class func uploadMultipleImages(Method method:HTTPMethod,url:String,parameters:Dictionary<String,AnyObject>?,headers:HTTPHeaders?,imageData:Data!,uploadParamName:String,showProgress:Bool,showAlert:Bool,completion: @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void, progressCompletion: @escaping (_ progress: Double) -> Void) {
        
        AF.upload(multipartFormData: { multiPart in
            if parameters != nil
            {
                for (key,value) in  parameters!{
                    multiPart.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        }, with: url as! URLRequestConvertible)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            printLog(msg:"Upload Progress: \(progress.fractionCompleted)")
            progressCompletion(progress.fractionCompleted)

        })
        .responseJSON(completionHandler: { (response) in
            switch response.result {
                case .success:
                    logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")

                    let responseJSON = JSON(Utils.jsonFromData(data: response.data!))
                    completion(responseJSON,"")
                case .failure(let error):
                    
                    if error._code == NSURLErrorTimedOut {
                        //timeout here
                    }
                    printLog(msg:"\n\nrequest with error:\n \(error)")
                    var message = error.localizedDescription
                    /*if !showAlert {
                     failure(response.response, message)
                     return
                     }*/
                    if response.response != nil {
                        //In case  of responsemessage in body
                        //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                        if let json = dataToJSON(data: response.data!) {
                            message = JSON(json)["message"].stringValue
                        }
                    }
                    failure(response.response, message)
            }
        })
    }


    class func upload(url: String, params: [String: Any],showAlert:Bool,viewContoller : UIViewController,completion: @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void) {


        logD("Request Data URL:\(url)\nParams:\(String(describing: params))\nHeaders:\(String(describing: const_HeaderWithToken))")
        Utils.showLoading(title: "Please Wait..")

        let urlString = url
        AF.upload(
            multipartFormData: { multipartFormData in
                if !params.isEmpty{
                    print(params)
                    for (key, value) in params {
                        print(key)
                        if let imageData = value as? [AGImageInfo] {
                            for item in imageData{
                                multipartFormData.append(item.data, withName: key, fileName: item.fileName, mimeType: item.type)
                            }
                        }
                        else if let imageData = value as? AGImageInfo {
                            multipartFormData.append(imageData.data, withName: key, fileName: imageData.fileName, mimeType: imageData.type)
                        } else{
                            multipartFormData.append("\(value)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                        }
                    }
                }},
            to: urlString,
            method: .post,
            headers: const_HeaderWithToken)
            .responseJSON { (response) in
                switch response.result {

                    case .success:
                        Utils.hideLoading()
                        logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")
                        let responseJSON = JSON(Utils.jsonFromData(data: response.data!))
                        completion(responseJSON,"")
                    case .failure(let error):
                        Utils.hideLoading()
                        if error._code == NSURLErrorTimedOut {
                            //timeout here
                        }
                        printLog(msg:"\n\nrequest with error:\n \(error)")
                        var message = error.localizedDescription
                        /*if !showAlert {
                         failure(response.response, message)
                         return
                         }*/
                        if response.response != nil {
                            //In case  of responsemessage in body
                            //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                            if let json = dataToJSON(data: response.data!) {
                                message = JSON(json)["message"].stringValue
                            }
                        }
                        else {
                            if showAlert {
                                Utils.showAlert(targetVC: viewContoller, title: "Alert", message: message, style: .alert)
                            }
                        }
                        failure(response.response, message)
                }
            }
    }

    class func uploadMultipleImagesForUser(Method method:HTTPMethod,url:String,parameters:Dictionary<String,AnyObject>?,headers:HTTPHeaders?,showProgress:Bool,showAlert:Bool,viewController : UIViewController, completion: @escaping (_ result: JSON, _ headerMessage:String) -> Void,  failure:@escaping (_ httpresponse: HTTPURLResponse?,_ errorMessage: String) -> Void, progressCompletion: @escaping (_ progress: Double) -> Void)
    {
        AF.upload(multipartFormData: { multipartFormData in

                    if parameters != nil
                    {
                        for (key, value) in parameters! {
                            if let imageData = value as? AGImageInfo {
                                multipartFormData.append(imageData.data, withName: key, fileName: imageData.fileName, mimeType: imageData.type)
                            }
                            multipartFormData.append("\(value)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                        }
                    }}
                  , with: URLRequest (url: URL (string: url)!) as URLRequestConvertible) .uploadProgress(queue: .main, closure: { progress in
                    //Current upload progress of file
                    printLog(msg:"Upload Progress: \(progress.fractionCompleted)")
                    progressCompletion(progress.fractionCompleted)

                  })
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                    case .success:
                        logD("Response Data responseCode:\(String(describing: response.response?.statusCode))\nResponse String: \(String(describing: response.result))\n")

                        let responseJSON = JSON(Utils.jsonFromData(data: response.data!))
                        completion(responseJSON,"")
                    case .failure(let error):

                        if error._code == NSURLErrorTimedOut {
                            //timeout here
                        }
                        printLog(msg:"\n\nrequest with error:\n \(error)")
                        var message = error.localizedDescription
                        /*if !showAlert {
                         failure(response.response, message)
                         return
                         }*/
                        if response.response != nil {
                            //In case  of responsemessage in body
                            //message = JSON(dataToJSON(data: response.data!)!)["response"].stringValue
                            if let json = dataToJSON(data: response.data!) {
                                message = JSON(json)["message"].stringValue
                            }
                        }
                        else {
                            if showAlert {
                                Utils.showAlert(targetVC: viewController, title: "Alert", message: message, style: .alert)
                            }
                        }
                        failure(response.response, message)
                }
            })
    }
}

