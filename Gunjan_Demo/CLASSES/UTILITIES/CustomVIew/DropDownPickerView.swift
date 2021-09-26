//
//  DropDownPickerView.swift
//  
//

import UIKit
import SwiftyJSON

class DropDownPickerView: UIPickerView {
    
    var pickerOptions:Array<String> = []
    var currentTextField:UITextField!
    var accountOptions:[JSON] = []
    var accountSelectedOptions:JSON!

}
