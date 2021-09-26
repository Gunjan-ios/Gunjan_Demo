//
//  ViewController.swift
//  Gunjan_Demo
//
//  Created by Gunjan Raval on 25/09/21.
//

import UIKit
import SwiftyJSON
import MaterialComponents

class ViewController: ParentClass {

    fileprivate var txtFirst : MDCOutlinedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        //        showBanner(title: "this is subtitle..", subTitle: "", style: .success, vc: self )

        txtFirst = MDCOutlinedTextField (frame: CGRect (x: X_PADDING, y: 0, width: SCREEN_WIDTH - X_PADDING*2, height: NEXT_BUTTON_HEIGHT))
        txtFirst.InitDesign(pImageName: "profile", PInfoText: "firstName", pPlaceHolder: "Full Name")
        self.view.addSubview(txtFirst)

    }


}

extension ViewController {
    //MARK: - User Login
    func doLogin() {

        let strDeviceToken = getFromUserDefaultForKey("test") != nil ? JSON(getFromUserDefaultForKey("test")).stringValue : ""


        let param = [String: AnyObject]()

        APIManager.callAPIRequest(Method: .post, url: "\(BASE_URL_SUBENDPOINT)", parameters: param, headers: const_HeaderWithToken, showAlert: true, withloader:true, viewContoller: self , completion: { (DATA, message) in

        }) { (response, errorMessage) in

            printLog(msg:errorMessage)
        }
    }


}
