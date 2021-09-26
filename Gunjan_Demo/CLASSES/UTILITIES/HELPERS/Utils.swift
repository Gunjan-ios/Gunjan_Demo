//
//  Utils.swift
//  iBeacon
//
//  Created by Gunjan on 02/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import JQProgressHUD
import Foundation
import SwiftyJSON
import NotificationBannerSwift


class Utils: NSObject {

    static func getAlertController(title : String, message : String ,style: UIAlertController.Style) ->  UIAlertController {
        
        let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertVc.view.tintColor = colorPrimary
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : colorPrimary]
        let hogen = NSMutableAttributedString.init(string: title, attributes: attrs)
        alertVc.setValue(hogen,forKey: "attributedTitle")
        let attrsM  = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : colorPrimary]
        let hogenMessage = NSMutableAttributedString.init(string: message, attributes: attrsM)
        alertVc.setValue(hogenMessage,forKey: "attributedMessage")
        return alertVc
    }
    static func getPriceAlertController(title : String, message : String ,style: UIAlertController.Style) ->  UIAlertController {
        
        let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertVc.view.tintColor = colorPrimary
         let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : colorPrimary]
        let hogen = NSMutableAttributedString.init(string: title, attributes: attrs)
        alertVc.setValue(hogen,forKey: "attributedTitle")
        let attrsM = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : colorGreen]
        let hogenMessage = NSMutableAttributedString.init(string: message, attributes: attrsM)
        alertVc.setValue(hogenMessage,forKey: "attributedMessage")
        return alertVc
    }
    
    static func attributedString(str : String) -> NSAttributedString? {
        let attributes : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSAttributedString(string: str, attributes: attributes)
        return attributedString
    }


    static func mulitplelinebutton(strText :NSString , btn :UIButton){
        let fulltext : String = strText as String
        //getting the range to separate the button title strings
        let newlineRange: NSRange = strText.range(of: "\n")
        
        //getting both substrings
        var substring1 = ""
        var substring2 = ""
        
        if(newlineRange.location != NSNotFound) {
            substring1 = strText.substring(to: newlineRange.location)
            substring2 = strText.substring(from: newlineRange.location)
        }
        
        //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont .boldSystemFont(ofSize:SMALL_BUTTON_FONT_SIZE)
        let attributes1: [NSAttributedString.Key: Any] = [
            .font: font1,
            .foregroundColor: colorSubHeading_76
        ]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        
        let font2: UIFont = UIFont .systemFont(ofSize:  SUB_LABEL_DESC_FONT_SIZE)
        let attributes2: [NSAttributedString.Key: Any] = [
            .font: font2,
            .foregroundColor: colorSubSubHeading_94
        ]
        
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        
        attrString1.append(attrString2)

        //assigning the resultant attributed strings to the button
        btn.setAttributedTitle(attrString1, for: [])
    
    }
    static  func showAlert(targetVC: UIViewController, title: String, message: String ,style: UIAlertController.Style){
        DispatchQueue.main.async(execute: {
            let alert = getAlertController(title : title, message : message, style: style)
            alert.addAction((UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            })))
            targetVC.present(alert, animated: true, completion: nil)
        })
    }
    static  func showLoginAlert(targetVC: UIViewController, title: String, message: String ,style: UIAlertController.Style){
        DispatchQueue.main.async(execute: {
            let alert = getAlertController(title : title, message : message, style: style)
            alert.addAction((UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
//                let loginVc = self.strotyBoard.instantiateViewController(identifier: CS.Identifiers.LoginVC) as LoginVC
//                targetVC.navigationController?.pushViewController(loginVc)
            })))
            targetVC.present(alert, animated: true, completion: nil)
        })
    }

    static  func showAlertWithPreviousAction(msg: String,targetView : UIViewController) {
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let copyAction = UIAlertAction(title: CS.Common.ok, style: .default) { _ in
            targetView.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(copyAction)
        targetView.present(alertController, animated: true, completion: nil)
    }

    static  func showAlertWithDismissAction(msg: String,targetView : UIViewController) {
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let copyAction = UIAlertAction(title: CS.Common.ok, style: .default) { _ in
            targetView.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(copyAction)
        targetView.present(alertController, animated: true, completion: nil)
    }

    static  func showAlertWithRootAction(msg: String,targetView : UIViewController) {
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let copyAction = UIAlertAction(title: CS.Common.ok, style: .default) { _ in
            targetView.navigationController?.popToRootViewController(animated: true)
        }
        alertController.addAction(copyAction)
        targetView.present(alertController, animated: true, completion: nil)
    }

    static func dateConvert(date: String) -> String{
        if (date == ""){
            return date
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateTimeFormatDefault
        let dateFormatterprintLog = DateFormatter()
        //        dateFormatterprintLog.dateFormat = dateFormatDisplay
        dateFormatterprintLog.dateStyle = .medium

        if let date1 = dateFormatter.date(from:date){
            return dateFormatterprintLog.string(from:date1)
        }else{
            printLog(msg:"There was an error decoding the string")
        }
        return date
    }

    static func getDate(complete date:String)-> String {
        if (date == ""){
            return date
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = dateTimeFormatDefault
        let dateFormatterprintLog = DateFormatter()
        dateFormatterprintLog.dateFormat = dateFormatDisplay
        if let date1 = dateFormatterGet.date(from:date ){
            return dateFormatterprintLog.string(from:date1)
        }
        else {
            printLog(msg:"There was an error decoding the string")
        }
        return date
    }

    static func getConvertDate(complete date:String)-> Date {
        if (date == ""){
            return Date()
        }

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = dateTimeFormatDefault
        let dateFormatterprintLog = DateFormatter()
        dateFormatterprintLog.dateFormat = dateFormatDisplay
        //        dateFormatterprintLog.dateStyle = .medium

        if let date1 = dateFormatterGet.date(from:date ){
            return date1
        }
        else {
            printLog(msg:"There was an error decoding the string")
        }
        return Date()
    }

   static func convertDateFormat(inputDate: String) -> String {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = dateTimeFormatDisplay
        let oldDate = olDateFormatter.date(from: inputDate)
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateStyle = .medium
        return convertDateFormatter.string(from: oldDate!)
    }

    static func getDateFormDays(strDay:Int) -> String {
        let today = Date()
        let Dates = Calendar.current.date(byAdding: .day, value: strDay, to: today)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateTimeFormatDisplay
        let days = dateFormatter.string(from: Dates)
        return days
    }

    static func getCurrentTimeStamp()-> String {
        let timestamp = NSDate().timeIntervalSince1970
        return "\(timestamp)"
    }


    static func showLoading(title : String)  {
        JQProgressHUDTool.jq_showCustomHUD( msg: title)
    }
    static func hideLoading()  {
        JQProgressHUDTool.jq_hideHUD()
    }
    static func mimeType(for data: Data) -> String {
        
        var b: UInt8 = 0
        data.copyBytes(to: &b, count: 1)
        
        switch b {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x4D, 0x49:
            return "image/tiff"
        case 0x25:
            return "application/pdf"
        case 0xD0:
            return "application/vnd"
        case 0x46:
            return "text/plain"
        default:
            return "application/octet-stream"
        }
    }
    
    static func stringFromJson(object: [JSON]) -> String{
        let newjson = JSON(object)
        let sjod = newjson.rawString()
        return sjod!
        //        let jsonData = try? JSONSerialization.data(withJSONObject: object, options: [])
        //        let jsonString = String(data: jsonData!, encoding: .utf8)
        //        return jsonString!
    }
    static func stringFromJson(obj: [String : Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: obj, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }
//    static func jsonObject(jsonString : String) -> JSON {
//        let jsonData = jsonString.data(using: .utf8)
//        if (jsonData != nil) {
//            let finalJSON = try? JSON(data: jsonData!)
//            return finalJSON!
//        }
//        else{
//            return JSON()
//        }
//    }

    static func dataFromJson(object: [String : Any]) -> Data {
        let jsonData = try? JSONSerialization.data(withJSONObject: object, options: [])
        if(jsonData == nil){
            return Data()
        }
        return jsonData!
    }


    static func jsonFromData(data : Data)-> [String : Any] {
        let dictionary = try? JSONSerialization.jsonObject(with: data, options: [])
        if(dictionary == nil){
            return [:]
        }
        return dictionary as! [String : Any]
    }

    static func stringFromJson(object: [String : Any]) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: object, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }


    static func stringFromDICJson(object: NSMutableDictionary) -> String{
        let jsonData = try? JSONSerialization.data(withJSONObject: object, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString!
    }


    static func jsonDicObject(jsonString : String) -> NSMutableDictionary {
        let jsonData = jsonString.data(using: .utf8)
        var dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options:  [])
        if dictionary == nil{
            dictionary = NSMutableDictionary()
        }
        return dictionary! as! NSMutableDictionary
    }


    static func jsonObject(jsonString : String) -> [[String : Any]] {
        let jsonData = jsonString.data(using: .utf8)
        var dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options:  [])
        if dictionary == nil{
            dictionary = [[String:Any]]()
        }
        return dictionary! as! [[String : Any]]
    }


    static func getTextfield(view: UIView) -> [UITextField] {
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                if textField.text == "" {
                    //                    ParentClass.shared.checkTextfield = 1
                }else{
                    results += [textField]
                }
            } else {
                results += getTextfield(view: subview)
            }
        }
        return results
    }


    static func stringFromJson(object: JSON) -> String{
        let strJson = object.rawString()
        return strJson!
    }


    static func parse(string:String) -> JSON {
        let json = string.data(using: String.Encoding.utf8).flatMap({try? JSON(data: $0)}) ?? JSON(NSNull())
        return json
    }
}

