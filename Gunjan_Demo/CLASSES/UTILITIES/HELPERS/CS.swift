//
//  Strings.swift
//  Matchfit
//
//  Created by Gunjan Raval on 23/08/18.
//  Copyright © 2018 Gunjan. All rights reserved.
//
//

import Foundation

class CS {
    
    struct EndPoints {
      static let Login = "Login"
    }
   
    struct Params {
        static let first_name = "first_name"
        static let last_name = "last_name"
        static let mobile = "mobile"
        static let email = "email"
        static let password = "password"
        static let address = "address"
        static let otp = "otp"
        static let user_id = "user_id"
        static let old_password = "old_password"
        static let new_password = "new_password"
    }

    struct Identifiers {
        static let DetailViewController  = "DetailViewController"
    }

    struct Segue {
        static let   optToHome = "optToHome"
    }

    struct Common {
        static let waiting = "Loading.."
        static let defaultFailedMessage = "Failed. Please try again."
        static let cameramessage = "Can't aceess camera in this device."
        static let Getdata = "Getting Data Successfully"
        static let pushdata = "Data saved."
        static let Connected = "Internet connected."
        static let NoData = "Nothing availbable to display."
        static let Internet = "Check your internet connection."
        static let FetchData = "Fetching data..."
        static let wrongMsg = "Something went wrong. Please try again."
        static let copyMsg = "Code Copied"
        static let msgLogout = "Are you sure to logout?"
        static let msgDelete = "Are you sure want to delete this user?"
        static let msgyes = "Yes"
        static let msgNo = "No"
        static let subscriptionMsg = "Subscribe Video"
        static let addWalletMsg = "Add rupees in Wallet"
        static let ok = "OK"

    }
    
    struct Login {
        static let invalidLastName = "Please enter a valid Branch Name."
        static let invalidFirstName = "Please enter a valid Company Name / Full Name."
        static let invalidEmail = "Please enter a valid Email."
        static let invalidMobile = "Please enter a valid Mobile number."
        static let invalidOldPasswrod = "Please enter a valid old password."
        static let invalidpasswrod = "Please enter a valid password."
        static let invalidConfirmpasswrod = "Please enter a valid Confirmpassword."
        static let ConfrimPasswrod = "Do not match password."
        static let invalidcredentials = "Please enter a valid login credentials."
        static let Terms = "Please agree Term & Condition."
        static let otpMsg = "Please enter vaild OTP code."
        static let invalidUserType = "Please enter a user type"

        
    }
    struct Location {
        static let locationDisabled = "Location services are disabled."
        static let locationDenied = "Access to location service is disabled."
    }
    
    

}

