//
//  ViewController.swift
//  Gunjan_Demo
//

import UIKit
import SwiftyJSON
import MaterialComponents

class ViewController: ParentClass {

    fileprivate var txtFirst : MDCOutlinedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = getFromUserDefaultForKeyByUnArchive(key_dataSave)
//        let strDeviceToken = getFromUserDefaultForKey("data") != nil ? JSON(getFromUserDefaultForKey("data")).stringValue : ""
        getListAPI()
    }
}



//MARK: - API FUNCATION

extension ViewController {
    func getListAPI() {

        APIManager.callAPIGetRequest(Method: .get, url: "\(BASE_URL)\(API_KEY)", parameters: nil, headers: const_HeaderWithToken, showAlert: true, withloader:true, viewContoller: self , completion: { (DATA, message) in
            
            setToUserDefaultForKeyByArchive(DATA["articles"], key: key_dataSave)

        }) { (response, errorMessage) in
            self.showBanner(title: "Alert", subTitle: errorMessage , style: .danger, vc: self)
        }
    }


}
