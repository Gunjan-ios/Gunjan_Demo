//
//  GeneralConstants.swift
//  VTV News
//
//  Created by Nascent Info Tech on 3/4/19.
//  Copyright © 2019 Nascent Info Tech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


let SCREEN_WIDTH = Int(UIScreen.main.bounds.width)
let SCREEN_HEIGHT = Int(UIScreen.main.bounds.height)


var STATUS_BAR_HEIGHT = Int(UIApplication.shared.statusBarFrame.height)

let NAV_HEADER_HEIGHT = 44
let TOP_HEADER_HEIGHT = 50
let TOP_PROGRESSBAR_HEIGHT = 50
let TOP_SUBHEADER_HEIGHT = 72
let HEADER_BUTTON_WIDTH = 80
let TAB_HEADER_HEIGHT = 50.0

let NEXT_BUTTON_WIDTH = 120
let NEXT_BUTTON_HEIGHT = 50
let EDIT_TEXT_HEIGHT = 60

let VIEW_HEIGHT = 100


let STEP_HEADER_HEIGHT = 2



let CLOSE_BUTTON_WH = 60
let SUBHEADER_BUTTON_HEIGHT = 40
let LABEL_HEIGHT = 35
var LABEL_WIDTH_SE = 150
var LABEL_WIDTH = 200

let LABEL_CELL_HEIGHT = 25
let ROW_CELL_HEIGHT = 30
let TABLE_HEADER_HEIGHT = 40

let USERLIST_CELL_HEIGHT:CGFloat = 100.0

let TABLEVIEW_CELL_HEIGHT:CGFloat = 90.0
let CONFIRM_CELL_HEIGHT:CGFloat = 75.0

let CELL_LABEL_HEIGHT = 25
let Order_CELL_LABEL_HEIGHT = 32

let TABLEVIEW_Y_POSITION = STATUS_BAR_HEIGHT + Int(ParentClass.shared.iPhone_X_Top_Padding) + TOP_HEADER_HEIGHT + Int(TAB_HEADER_HEIGHT)

let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
let IS_IPHONE_5 = (IS_IPHONE && UIScreen.main.bounds.size.height == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && UIScreen.main.bounds.size.height == 667.0)
let IS_IPHONE_6_PLUS = (IS_IPHONE && UIScreen.main.bounds.size.height == 736.0)
let IS_IPHONE_XS_MAX = (IS_IPHONE &&  UIScreen.main.nativeBounds.size.height == 2688.0)
let IS_IPHONE_XR = (IS_IPHONE && UIScreen.main.nativeBounds.size.height == 1792.0)

// It's compatble for iphone x, xr and xmax
// So it is used for iphone x porpose as well as for iphone x,xmax and xr
// When it is used for iphone x , xmax and xr, set iphone x condition at last in if condition
let IS_PHONE_6_7_8 = (IS_IPHONE && UIScreen.main.bounds.size.height == 568.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 667.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 736.0)

let IS_IPHONE_X_XR_XMAX_12 = (IS_IPHONE && UIScreen.main.bounds.size.height == 812.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 896.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 844.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 926.0) || (IS_IPHONE && UIScreen.main.bounds.size.height == 780.0)


let CELL_HEIGHT = 80

let HEDER_SECTION_HEIGHT:CGFloat = 40.0


let DATATYPE_DROPDOWN_ICON = "downArrow"

let labelTextColor = UIColor.gray
let APP_FONT_NAME = "SFProText-Regular"
let APP_FONT_NAME_BOLD = "SFProText-Bold"
let APP_FONT_NAME_MEDIUM = "SFProText-Medium"
let LABEL_FONT_SIZE:CGFloat = 8

let TEXTFIELD_FONT_SIZE:CGFloat = 13
let BUTTON_FONT_SIZE:CGFloat = 16
let SMALL_BUTTON_FONT_SIZE:CGFloat = 13
let HEADER_LABEL_FONT_SIZE:CGFloat = 24
let SUB_HEADER_LABEL_FONT_SIZE:CGFloat = 14
let NAV_HEADER_FONT_SIZE:CGFloat = 17
let HEADER_FONT_SIZE:CGFloat = 17
let SHARE_BUTTON_FONT_SIZE:CGFloat = 12


let X_PADDING = 15
let YTEXTFILED_PADDING = 25

let X_PADDING_SUBHEADER = 2
let Y_PADDING = 8
let X_PADDING_FOR_COMBOBOX = 70
let CUSTOM_TEXTFIELD_HEIGHT = 30
let CUSTOM_COMBOBOX_TEXTFIELD_HEIGHT = 38
let CUSTOM_BUTTON_HEIGHT = 40
let controls_height = 70
let MORE_HEADER_HEIGHT = 100
let CUSTOM_LABEL_HEIGHT = 21
let DYNAMIC_LABEL_HEIGHT = 24



// TAG 
let TAG1 = 1
let TAG2 = 2
let TAG3 = 3
let TAG4 = 4
let TAG5 = 5
let TAG6 = 6
let TAG7 = 7
let TAG8 = 8
let TAG9 = 9
let TAG10 = 10
let TAG11 = 11
let TAG12 = 12
let TAG13 = 13
let TAG14 = 14
let TAG15 = 15
let TAG16 = 16
let TAG17 = 17
let TAG18 = 18
let TAG19 = 19
let TAG20 = 20
let TAG21 = 21





let HEADER_LABEL_FONT_NAME = "SFProText-Semibold"
let TAB_FONT = "SFProText-Medium"
let REGULAR_FONT_NAME = "SFProText-Regular"

let radius : CGFloat = 6.0
let imageradius : CGFloat = 8.0

let borderWidth : CGFloat = 1

// Colors
var buttonBorderColor = UIColor(red: 198.0/255.0, green: 198.0/255.0, blue: 198.0/255.0, alpha: 1.0)
let buttonTextColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
let buttonBackgroundColor = UIColor(red: 25.0/255.0, green: 118.0/255.0, blue: 210.0/255.0, alpha: 1.0)
let textFieldTextColor = UIColor(red: 198.0/255.0, green: 198.0/255.0, blue: 198.0/255.0, alpha: 1.0)
let blueTextColor = UIColor(red: 25.0/255.0, green: 118.0/255.0, blue: 210.0/255.0, alpha: 1.0)
let grayTextColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.6)
let themeColor = UIColor(red: 0/255.0, green: 150/255.0, blue: 136/255.0, alpha: 1)

//let colorCommonBackground = UIColor.init(white: 0.2, alpha: 1)
let colorPrimary = UIColor (hex: "142760")
let colorPrimaryDark = UIColor (hex: "12255C")
let colorAccent = UIColor (hex: "317114")
let colorGreen = UIColor (hex: "009900")
let colorCommonBackground = UIColor (hex: "202020")
let colorListingHeading_25 = UIColor (hex: "5F5F5F")
let colorSubHeading_76 = UIColor (hex: "767676")
let colorSubSubHeading_94 = UIColor (hex: "949494")
let colorDividerBG_f4 = UIColor (hex: "f4f4f4")
let colorPlaceHolder_C6 = UIColor (hex: "c6c6c6")
let colorRed = UIColor (hex: "D32F2F")


let LINE_BACKGROUND_COLOUR = UIColor.lightGray
let HEADER_BACKGROUND_COLOUR = UIColor.white
let SUBHEADER_BACKGROUND_COLOUR = UIColor(red: 0.0/255.0, green: 75.0/255.0, blue: 160.0/255.0, alpha: 1.0)
let SEPARATE_BACKGROUND_COLOUR = UIColor(red: 0.0/255.0, green: 75.0/255.0, blue: 160.0/255.0, alpha: 0.38)
let STEP_BACKGROUND_COLOUR = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.38)
let ALERT_BACKGROUND_COLOUR = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.50)

//rgba(0, 75, 160, 1)
let NOTE_COLOUR = UIColor.red
let LABEL_HEADER_COLOUR = UIColor.white

let SUB_LABEL_HEADER_COLOUR = UIColor.black
let SUB_LABEL_DESC_COLOUR = UIColor(red: 198.0/255.0, green: 198.0/255.0, blue: 198.0/255.0, alpha: 1.0)
let SUB_LABEL_DESC_FONT_SIZE:CGFloat = 11

let IMAGES_FOLDER_NAME = "ImagesPhoto"
let UNIT_IMAGES = "UnitPhoto"
let PRODUCT_IMAGES = "ProductPhoto"
let MANUFACTRUNG_IMAGES = "ManufacturingPhoto"
let ACHIEVEMENT_IMAGES = "AchievementPhoto"

let VIDEOS_FOLDER_NAME = "ManufacturingVideo"

let DOCUMENTS_FOLDER_NAME = "LocalDocuments"
let AUDIO_FOLDER_NAME = "LocalAudios"
let VIDEO_FOLDER_NAME = "LocalVideos"
let  LOADING_TITLE = "Please Wait..."
let  UPLAOD_TITLE = "Uploading..."


//MARK: - DateTime -
let dateTimeFormatDefault          = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
let dateTimeFormatDisplay          = "MMM dd,yyyy hh:mm a" 
let dateFormatDefault                 = "yyyy-MM-dd"
let dateFormatDisplay                 = "MM-dd-yyyy"
let timeFormatDefault                 = "HH:mm"
let timeFormatDisplay                 = "hh:mm a"     //12:00 AM
let dateTimeFormatNotification     = "dd:MM:yyyy hh:mm:ss"
let dateFormatShort                    = "dd MMM"
let dateFormatShortMonth           = "MM-yyyy"
let dateFormatShortMonthLoc      = "yyyy-MM"
let dateFormatShortYear              = "yyyy"
let dateFormatDisplaySort           = "MMM dd,yyyy"
let dateFormatFilter                    = "MM/dd/yyyy"

var const_HeaderWithToken : HTTPHeaders   = ["Content-Type" : "multipart/form-data", "Accept": "application/json" ]

//let radius : CGFloat = 6.0
let borderwidth : CGFloat = 0.7
let shadowradius : CGFloat = 2.0


let tableCellColor : UIColor = .systemGray6
let bordercolor : UIColor = .label
