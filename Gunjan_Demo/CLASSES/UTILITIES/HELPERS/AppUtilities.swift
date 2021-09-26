//
//  ShopeLivUtilities.swift
//  ShopeLiv
//
//  Created by Suresh on 01/03/18.
//  Copyright © 2018 Jagannath. All rights reserved.
//

import UIKit
import SwiftyJSON
class ConnflixUtilities: NSObject {
    
    static let shared = ConnflixUtilities()
    private override init() { }

    //MARK: Logged in userID
    var UserID: String? {
        get {
            return UserDefaults.standard.object(forKey: CS.Params.user_id) as? String
        }
        set {
            if let value = newValue {
                UserDefaults.standard.setValue(value, forKey: CS.Params.user_id)
                UserDefaults.standard.synchronize()
            }
        }
    }
    var  isSubUser: Int? {
        get {
            return UserDefaults.standard.object(forKey: "isSubUser") as? Int
        }
        set {
            if let value = newValue {
                UserDefaults.standard.setValue(value, forKey: "isSubUser")
                UserDefaults.standard.synchronize()
            }
        }
    }
    var mobile : String? {
        get {
            return UserDefaults.standard.object(forKey: CS.Params.mobile) as? String
        }
        set {
            if let value = newValue {
                UserDefaults.standard.setValue(value, forKey: CS.Params.mobile)
                UserDefaults.standard.synchronize()
            }
        }
    }
    var email : String? {
        get {
            return UserDefaults.standard.object(forKey:CS.Params.email) as? String
        }
        set {
            if let value = newValue {
                UserDefaults.standard.setValue(value, forKey: CS.Params.email)
                UserDefaults.standard.synchronize()
            }
        }
    }

//    var isStoreAdded: Bool? {
//        get {
//            return UserDefaults.standard.object(forKey: Macros.kSettingStoreAdding) as? Bool
//        }
//        set {
//            if let value = newValue {
//                UserDefaults.standard.setValue(value, forKey: Macros.kSettingStoreAdding)
//                UserDefaults.standard.synchronize()
//            }
//        }
//    }

    var firstname: String? {
        get {
            return UserDefaults.standard.object(forKey: CS.Params.first_name) as? String
        }
        set {
            if let value = newValue {
                UserDefaults.standard.setValue(value, forKey: CS.Params.first_name)
                UserDefaults.standard.synchronize()
            }
        }
    }
}



