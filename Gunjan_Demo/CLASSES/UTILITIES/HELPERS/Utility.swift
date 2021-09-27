//
//  utility.swift
//  Swift Structure

import Foundation
import AVFoundation
import AVKit
import MapKit
import CoreLocation
import Alamofire
import IQKeyboardManagerSwift
import SwiftyJSON

//MARK: - Log(printLog) Utility
func logD(_ message:Any,
          file: String = #file, line: Int = #line,function: String = #function) {
    let str  : NSString = file as NSString
    //   #if DEBUG
    printLog(msg: "[\(str.lastPathComponent)][\(line)][\(function)]\n💜\(message)💜\n")
    //  #endif
}
func printLog(msg: Any){
    print(msg)
}

//MARK: - UIView
//Border
func setDefaultBorder(_ view : UIView, color : UIColor, width : CGFloat)
{
    view.layer.borderColor = color.cgColor
    view.layer.borderWidth = width
}

//Add Shadow To View
func addShadow(views: [UIView], opacity: CGFloat, radius: CGFloat, color: UIColor)
{
    for view in views
    {
        view.layer.shadowOpacity = Float(opacity) //0.7
        view.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        view.layer.shadowRadius = radius //5.0
        view.layer.shadowColor = color.cgColor
    }
}

//Set Borders
func setBorders(_ arrViews: [UIView], color : UIColor, radius : CGFloat, width : CGFloat)
{
    for view in arrViews
    {
        view.layer.borderWidth = width
        view.layer.borderColor = color.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
}

func setCornerRadius(_ arrViews : [UIView], radius : CGFloat)
{
    for view in arrViews
    {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
}

func setTextFieldsIndicator(_ txtFields : UITextField, image:UIImage, position: Int)
{
    //position = 0 = left side, position = 1 = right side
    let imgView = UIImageView(image: image)
    imgView.contentMode = UIView.ContentMode.scaleAspectFit
    if (position==1)
    {
        let v = UIView(frame: CGRect(x: 10, y: 0, width: txtFields.frame.size.height, height: txtFields.frame.size.height))
        imgView.frame = CGRect(x: v.bounds.size.height-24, y: 10, width: v.bounds.size.height-20, height: v.bounds.size.height-20)
        
        v.addSubview(imgView)
        txtFields.rightViewMode = UITextField.ViewMode.always;
        txtFields.rightView = v;
    }
    else
    {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: txtFields.frame.size.height-10, height: txtFields.frame.size.height-10))
        imgView.frame = CGRect(x: 10, y: 10, width: v.bounds.size.height-20, height: v.bounds.size.height-20);
        imgView.contentMode = UIView.ContentMode.scaleAspectFit
        v.addSubview(imgView)
        txtFields.leftViewMode = UITextField.ViewMode.always;
        txtFields.leftView = v;
    }
}

func setTextFieldModification(arrTextField:[UITextField],arrImages :[AnyObject],position:Int,showIndicatorImage:Bool)
{
    for textField in arrTextField
    {
        if showIndicatorImage {
            setTextFieldsIndicator(textField , image: UIImage(named: arrImages[arrTextField.firstIndex(of: textField)!] as! String)! , position: position);
        }
    }
}

//Right Indicator
func setTextFieldIndicator(_ txtField : UITextField, image : UIImage)
{
    let imageView = UIImageView(image: image)
    txtField.rightViewMode = UITextField.ViewMode.always
    imageView.frame = CGRect(x: 0.0, y: 0.0, width: 15.0, height: 15.0)
    imageView.contentMode = UIView.ContentMode.scaleAspectFit
    imageView.clipsToBounds = true
    txtField.rightView = imageView;
}

//Right Indicator ArrTextFields
func setArrTextFieldIndicator(_ arrTextFields: [UITextField], arrImages : [AnyObject])
{
    for txtField in arrTextFields
    {
        setTextFieldIndicator(txtField, image: UIImage(named: arrImages[arrTextFields.firstIndex(of: txtField)!] as! String)!)
    }
}

//User Interaction
func setUserInterAction(_ arrViews: [UIView], isOn : Bool)
{
    for view in arrViews
    {
        view.isUserInteractionEnabled = isOn
    }
}

//Label Color
func setLabelColor(_ arrLables: [UILabel], color : UIColor)
{
    for label in arrLables
    {
        label.textColor = color
    }
}

//Text Color
func setTextColor(_ arrtxtflds: [UITextField], color : UIColor)
{
    for txtfld in arrtxtflds
    {
        txtfld.textColor = color
    }
}

//Left Margin
func setLeftPadding(_ txtField: UITextField)
{
    let view = UIView()
    view.frame = CGRect(x: 0.0, y: 0.0, width: 10, height: 20)
    txtField.leftViewMode = UITextField.ViewMode.always
    txtField.leftView = view
}

//MARK: - Set Borders
func addTextFieldsBottomBorder(_ arrTextFields: [UITextField], color: UIColor)
{
    for textfields in arrTextFields
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textfields.bounds.size.height - 1, width: textfields.bounds.size.width, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        textfields.borderStyle = UITextField.BorderStyle.none
        textfields.layer.addSublayer(bottomLine)
    }
}

//Add Border to View
func addTopBorderWithColor(_ objView : UIView, color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: 0, width: objView.frame.size.width, height: width)
    objView.layer.addSublayer(border)
}

func addBottomBorderWithColor(_ objView : UIView, color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: objView.frame.size.height - width, width: objView.frame.size.width, height: width)
    objView.layer.addSublayer(border)
}

func addLeftBorderWithColor(_ objView : UIView, color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: 0, width: width, height: objView.frame.size.height)
    objView.layer.addSublayer(border)
}

func addRightBorderWithColor(_ objView : UIView, color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: objView.frame.size.width, y: 0, width: width, height: objView.frame.size.height)
    objView.layer.addSublayer(border)
}

func addTextViewBottomBorder(_ arrTextViews: [IQTextView])
{
    for textView in arrTextViews
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textView.bounds.height - 1, width: textView.bounds.width, height: 1.0)
        bottomLine.backgroundColor = colorPrimary.cgColor
        textView.layer.addSublayer(bottomLine)
    }
}

//MARK: - Currency Formattion
func getCurrencyFormat(localeIdentifier: String, price: NSNumber) -> String
{
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = NumberFormatter.Style.currency
    // localize to your grouping and decimal separator
    let locale = NSLocale(localeIdentifier: localeIdentifier)
    locale.displayName(forKey:  NSLocale.Key.currencySymbol, value: localeIdentifier)
    currencyFormatter.locale = locale as Locale?
    let priceString = currencyFormatter.string(from: price)
    return priceString!
    
}

//MARK: - Calling Number
func callNumber(_ phoneNumber:String) {
    if let phoneCallURL:URL = URL(string:"tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            if #available(iOS 10.0, *) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(phoneCallURL)
                // Fallback on earlier versions
            }
        }
    }
}

//MARK: - Play Audio
func playAudio(_ fileName: String)
{
    let resourcePath = Bundle.main.resourcePath!
    let filePath = "\(resourcePath)/" + "\(fileName)"
    printLog(msg: filePath)
    let url: URL = URL(fileURLWithPath: filePath)
    let playerObject = AVPlayer(url: url)
    let playerController = AVPlayerViewController()
    playerController.player = playerObject
    playerObject.play()
}

//MARK:- Open Translate Url
func openTranslateUrl(withText: String)
{
    let txtAppend = withText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    let url = "https://translate.google.com/#auto/en/\(txtAppend!)"
    let openUrl = NSURL(string: url)
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(openUrl! as URL, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(openUrl! as URL)
    }
}

//MARK: - Convert hex into color
func intFromHexString(hexStr: String) -> UInt32 {
    var hexInt: UInt32 = 0
    // Create scanner
    let scanner: Scanner = Scanner(string: hexStr)
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
    // Scan hex value
    scanner.scanHexInt32(&hexInt)
    return hexInt
}


//MARK: - Show Map Directions
func getMapDirection(mapView: MKMapView,lattitude: Double, longitude: Double)
{
    let url = "http://maps.apple.com/?saddr=\(mapView.userLocation.coordinate.latitude),\(mapView.userLocation.coordinate.longitude)&daddr=\(lattitude),\(longitude)"
    if #available(iOS 10.0, *) {
        UIApplication.shared.open((NSURL(string: url)! as URL), options: [:], completionHandler: nil)
    } else {
        // Fallback on earlier versions
    }
}

//MARK: - Json Functions
//Load Json from file
func loadJson(forFilename fileName: String) -> NSDictionary? {
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        if let data = NSData(contentsOf: url) {
            do {
                let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                
                return dictionary
            } catch {
                printLog(msg:"Error!! Unable to parse  \(fileName).json")
            }
        }
        printLog(msg:"Error!! Unable to load  \(fileName).json")
    }
    
    return nil
}

//Convert Json to Data
func jsonToData(json: Any) -> Data? {
    do {
        return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
    } catch let myJSONError {
        printLog(msg:myJSONError)
    }
    return nil;
}

//Convert from NSData to JSON Object
func dataToJSON(data: Data) -> Any? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    } catch let myJSONError {
        printLog(msg:myJSONError)
    }
    return nil
}

//MARK: - Image Fuctions
//Download Image async
func downloadImage(url:String,imgView:UIImageView)
{
    URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
        if error != nil {
            //printLog(error ?? <#default value#>)
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            imgView.image = image
        })
        
    }).resume()
}

//Save image to Directory
func saveImageToDirectory(folderName: String, image: UIImage, imageName: String)
{
    var documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    if folderName != ""
    {
        // Create a new path for the new images folder
        documentsDirectoryURL = documentsDirectoryURL.appendingPathComponent(folderName)
        //var objcBool:ObjCBool = true
        let isExist = FileManager.default.fileExists(atPath: documentsDirectoryURL.path)
        //fileExistsAtPath(imagesDirectoryPath, isDirectory: &objcBool)
        // If the folder with the given path doesn't exist already, create it
        if isExist == false{
            do{
                try FileManager.default.createDirectory(atPath: documentsDirectoryURL.path, withIntermediateDirectories: true, attributes: nil)
            }catch{
                printLog(msg:"Something went wrong while creating a new folder")
            }
        }
    }
    // create a name for your image
    let fileURL = documentsDirectoryURL.appendingPathComponent(imageName)
    if !FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            // UIImagePNGRepresentation(self.imgview.image!)!
            try image.jpegData(compressionQuality: 1.0)?.write(to: fileURL)
            printLog(msg:fileURL)
            printLog(msg:"Image Added Successfully")
            
        } catch {
            printLog(msg:error)
        }
    } else {
        printLog(msg:"Error! Image Not Added \nImage with same identifire is exist")
    }
}

//Get image to Directory
func getImageFromDirectory(folderName: String, imageName: String) -> UIImage?
{
    let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
    let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
    let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
    if let dirPath          = paths.first
    {
        var imageURL = URL(fileURLWithPath: "")
        imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(folderName)
        /*
         if folderName != "" {
         imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(folderName)
         }*/
        imageURL = URL(fileURLWithPath: imageURL.path).appendingPathComponent(imageName)
        //printLog(dirPath)
        let image    = UIImage(contentsOfFile: imageURL.path)
        if image != nil{
            // Do whatever you want with the image
            return image
        }
        else {
            printLog(msg:"Image Not Found")
            return nil
        }
    }
    
    return nil
}

//Make ImageView Rounded
func roundedImageView(imgView: UIImageView, borderWidth: Float, borderColor: UIColor)
{
    imgView.layer.cornerRadius = imgView.frame.size.width / 2
    imgView.clipsToBounds = true
    imgView.layer.borderWidth = CGFloat(borderWidth)
    imgView.layer.borderColor = borderColor.cgColor
}

//Set tint Color
func setTintColor(imgView : UIImageView, color : UIColor)
{
    imgView.image = imgView.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    imgView.tintColor = color
}

/*
//MARK:- TextField(ACFloatingTextField) Validations
func validateFloatingField(_ arrTextFiled : [ACFloatingTextfield]) -> Bool
{
    var isFieldValid = true
    for item in arrTextFiled {
        if !item.validate(cop: APP_DELEGATE.swiftCop)
        {
            isFieldValid = false
        }
    }
    return isFieldValid
}*/
/*
// Validate DropDown TextField
func validateDropDownField(_ arrTextFiled : [FloatingDropdownTextfield]) -> Bool
{
    var isFieldValid = true
    for item in arrTextFiled {
        if !item.validate(cop: APP_DELEGATE.swiftCop)
        {
            isFieldValid = false
        }
    }
    return isFieldValid
}*/

//MARK:- UITableView and UICollectionView configurations
//Configure TableView
func configureTableView(forVC vc:UIViewController, estimatedHeigth : CGFloat, tableView: UITableView)
{
    tableView.dataSource = vc as? UITableViewDataSource
    tableView.delegate = vc as? UITableViewDelegate
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = estimatedHeigth
}

//Configure CollectionView
func configureCollectionView(forVC vc: UIViewController, collectionView:UICollectionView, classname:AnyClass, space:CGFloat)
{
  /*  let identifier = String(describing: classname)
    collectionView.register(classname, forCellWithReuseIdentifier: identifier)
    collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = space
    collectionView.collectionViewLayout = layout*/
    collectionView.dataSource = vc as? UICollectionViewDataSource
    collectionView.delegate = vc as? UICollectionViewDelegate
    collectionView.alwaysBounceVertical = true
    
    collectionView.register(classname, forCellWithReuseIdentifier: "\(classname)")
    
    //collectionView.register(cellWithClass: CollectionViewCell.self)
    collectionView.register(UINib(nibName: "\(classname)", bundle: nil), forCellWithReuseIdentifier: "\(classname)")
    //collectionView.register(nib: UINib(nibName: "\(CollectionViewCell.self)", bundle: nil), forCellWithClass: CollectionViewCell.self)
    
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    layout.minimumInteritemSpacing = space
    layout.minimumLineSpacing = space
    collectionView.collectionViewLayout = layout
}

// Add Loading Cell
func showLoadingCell(_ indicatorColor:UIColor) -> UITableViewCell
{
    let cell = UITableViewCell(style: .default, reuseIdentifier: "LoadingCell")
    cell.backgroundColor = UIColor.clear
    cell.selectionStyle = .none
    cell.isUserInteractionEnabled = false
    
    //cell.textLabel?.text = msg_LoadingMore
    
    let actIndicator = UIActivityIndicatorView(style: .medium)
    actIndicator.color = indicatorColor
    //actIndicator.center = CGPoint(x: (UIScreen.mainScreen().bounds.size.width/2)-(actIndicator.bounds.size.width/2), y: cell.center.y)
    actIndicator.frame = CGRect(x: 20.0, y: 20.0, width: 20.0, height: 20.0)
    cell.contentView.addSubview(actIndicator)
    actIndicator.startAnimating()
    actIndicator.hidesWhenStopped = true
    
    //let lblLoading: UILabel     = UILabel(frame: CGRectMake(50, 0, cell.bounds.size.width-70.0, cell.bounds.size.height))
    let lblLoading: UILabel     = UILabel(frame: CGRect(x: 50, y: actIndicator.frame.origin.y, width: cell.bounds.size.width-70.0, height: 20.0))
    lblLoading.text             = "No data available."
    lblLoading.numberOfLines    = 0
    lblLoading.lineBreakMode    = NSLineBreakMode.byWordWrapping
    lblLoading.textColor        = UIColor.lightGray
    lblLoading.textAlignment    = .left   //.Center
    cell.contentView.addSubview(lblLoading)
    
    return cell
}

// Add Pull to Refresh
func addPullToRefresh(toView view: UIView, ctrlRefresh: inout UIRefreshControl?, targetController: UIViewController, refreshMethod: Selector)
{
    if ctrlRefresh == nil {
        ctrlRefresh = UIRefreshControl()
    }
    ctrlRefresh!.backgroundColor = UIColor.clear
    ctrlRefresh!.tintColor = UIColor.label
    ctrlRefresh!.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.white])
    ctrlRefresh!.addTarget(targetController, action: refreshMethod, for: .valueChanged)
    view.addSubview(ctrlRefresh!)
}

//Check Records Available
func checkRecordAvailable(for view: UIView, count: Int,  ctrlRefresh: UIRefreshControl?, targetController: UIViewController, displayMessage: String)
{
    if ctrlRefresh != nil {
        let updateString = "Last Updated at \(Date())"
        ctrlRefresh!.attributedTitle = NSAttributedString(string: updateString)
        ctrlRefresh!.endRefreshing()
    }
    
    if count > 0 {
        if view.isKind(of: UITableView.self) {
            (view as! UITableView).reloadData()
            (view as! UITableView).backgroundView = nil
        }
        else if view.isKind(of: UICollectionView.self) {
            (view as! UICollectionView).reloadData()
            (view as! UICollectionView).backgroundView = nil
        }
        else {
            view.viewWithTag(-111)?.removeFromSuperview()
        }
    }
    else {
        let lblNoData: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        lblNoData.text             = displayMessage
        lblNoData.numberOfLines    = 0
        lblNoData.lineBreakMode    = NSLineBreakMode.byWordWrapping
        lblNoData.textColor        = colorPrimary
        lblNoData.textAlignment    = .center
        lblNoData.font = UIFont (name: APP_FONT_NAME_BOLD, size: HEADER_FONT_SIZE)
        lblNoData.tag = -111
        
        if view.isKind(of: UITableView.self) {
            (view as! UITableView).reloadData()
            (view as! UITableView).backgroundView = lblNoData
            (view as! UITableView).separatorStyle = .none
        }
        else if view.isKind(of: UICollectionView.self) {
            (view as! UICollectionView).reloadData()
            (view as! UICollectionView).backgroundView = lblNoData
        }
        else {
            view.addSubview(lblNoData)
        }
    }
}

//MARK: - String Category
extension String {
    func toBool() -> Bool {
        switch self.lowercased() {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return false
        }
    }
}

extension Array {
    func contains<U: Equatable>(object:U) -> Bool {
        return (self.indexOf(object: object) != nil);
    }
    
    func indexOf<U: Equatable>(object: U) -> Int? {
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    return idx
                }
            }
        }
        return nil
    }
    
    mutating func removeObject<U: Equatable>(object: U) {
        let index = self.indexOf(object: object)
        if(index != nil) {
            self.remove(at: index!)
        }
    }
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.95)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.05)
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

//MARK: - ------------ Finish -----------
/*------------------------------------------------------------*/

//MARK: - User Default
//Set Value
func setToUserDefaultForKey(_ value:AnyObject?,key:String)
{
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

//Set Archive Value
func setToUserDefaultForKeyByArchive(_ value:[Article]?,key:String)
{
//    UserDefaults.standard.set(value == nil ? nil : NSKeyedArchiver.archivedData(withRootObject: value!), forKey: key)
//    UserDefaults.standard.synchronize()
    do {
        let data = try NSKeyedArchiver.archivedData(withRootObject: value!, requiringSecureCoding: true)
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    } catch {
        return
    }
}

//Get Value
func getFromUserDefaultForKey(_ key:String)->AnyObject?
{
    return UserDefaults.standard.object(forKey: key) as AnyObject?
}

//Get UnArchive Value
func getFromUserDefaultForKeyByUnArchive(_ key:String)->[Article]?
{
    return UserDefaults.standard.object(forKey: key) == nil ? nil :NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: key) as! Data) as! [Article]?

//    do {
//           let oldUbiquityIdentityToken = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(UserDefaults.standard.object(forKey: key)! as! Data) as AnyObject?
//            return oldUbiquityIdentityToken
//       } catch {
//            printLog(msg:error)
//            return nil
//       }
}

//Remove Value
func removeFromUserDefaultForKey(_ key:String)
{
    UserDefaults.standard.removeObject(forKey: key)
}


//MARK: - Date-Time Formattion
func getDefaultTime(time: String, format : String) -> Date { //Convert String Time to NSDate
    let timeFormatOriginal = DateFormatter()
    timeFormatOriginal.dateStyle = DateFormatter.Style.none
    timeFormatOriginal.timeStyle = DateFormatter.Style.short
    timeFormatOriginal.timeZone = TimeZone.current
    timeFormatOriginal.dateFormat = format
    return timeFormatOriginal.date(from: time)!
}

func getDefaultTimeToStore(time: String, format : String) -> String {
    let timeFormatOriginal = DateFormatter()
    timeFormatOriginal.dateStyle = DateFormatter.Style.none
    timeFormatOriginal.timeStyle = DateFormatter.Style.short
    timeFormatOriginal.timeZone = TimeZone.current
    timeFormatOriginal.dateFormat = format
    
    let time24 = timeFormatOriginal.date(from: time)
    
    timeFormatOriginal.dateFormat = timeFormatDefault
    
    return timeFormatOriginal.string(from: time24!)
}

func getGMTDateTime(_ datetime: Date, format : String) -> String {
    let timezone: TimeZone = TimeZone.autoupdatingCurrent
    let seconds: Int = timezone.secondsFromGMT()
    //offset
    
    //let currentdate: NSDate = NSDate()
    let dateFormat: DateFormatter = DateFormatter()
    dateFormat.dateFormat = format
    // format
    
    dateFormat.timeZone = TimeZone(secondsFromGMT: seconds)
    return dateFormat.string(from: datetime)
}

func getDefaultDate(_ datetime: String, format : String) -> Date {
    let dateFormat: DateFormatter = DateFormatter()
    dateFormat.dateFormat = format
    return dateFormat.date(from: datetime)!
}

func getDefaultDateWithTimeZone(_ datetime: String, format : String) -> Date {
    let dateFormat: DateFormatter = DateFormatter()
    dateFormat.dateFormat = format
    dateFormat.timeZone = TimeZone(identifier: "GMT")
    return dateFormat.date(from: datetime)!
}

func getDisplayDate(date: String, dateFormat : String, displayFormat : String) -> String {
    let datetimeFormatOriginal = DateFormatter()
    datetimeFormatOriginal.dateFormat = dateFormat
    
    let datetimeFormatDisplay = DateFormatter()
    datetimeFormatDisplay.dateFormat = displayFormat
    
    return datetimeFormatDisplay.string(from: datetimeFormatOriginal.date(from: date)!)
}

func getDateInDefaultFormat(date: String, dateFormat : String, dateStyle : DateFormatter.Style, timeStyle : DateFormatter.Style, isDisplayTime: Bool) -> String {
    let datetimeFormatOriginal = DateFormatter()
    datetimeFormatOriginal.dateFormat = dateFormat
    
    let datetimeFormatDisplay = DateFormatter()
    datetimeFormatDisplay.timeZone = TimeZone.current
    if isDisplayTime {
        datetimeFormatDisplay.timeStyle = timeStyle
    }
    datetimeFormatDisplay.dateStyle = dateStyle
    
    return datetimeFormatDisplay.string(from: datetimeFormatOriginal.date(from: date)!)
}

func convertDateFormate(date: String, convertFromFormat : String, convertToFormat : String) -> String {
    let datetimeFormatOriginal = DateFormatter()
    datetimeFormatOriginal.dateFormat = convertFromFormat
    
    let datetimeFormatDisplay = DateFormatter()
    datetimeFormatDisplay.dateFormat = convertToFormat
    
    return datetimeFormatDisplay.string(from: datetimeFormatOriginal.date(from: date)!)
}

func daysBetweenTwoDates(date: Date) -> String
{
    let calendar = NSCalendar.current
    
    // Replace the hour (time) of both dates with 00:00
    let fromDate = calendar.startOfDay(for: Date())
    let toDate = calendar.startOfDay(for: date)
    
    let flags = Calendar.Component.day
    let components = calendar.dateComponents([flags], from: fromDate, to: toDate)
    if components.day == 0 {
        let currentHour = calendar.component(.hour, from: Date())
        let newHour = calendar.component(.hour, from: date)
        return "\(currentHour - newHour) hours ago"
    }
    if components.day == -1 {
        return "Yesterday"
    }
    if components.day == -2 {
        return "Two days ago"
    }
    return ""
}

func animateCell(_ cell: UITableViewCell) {
    cell.layer.transform = CATransform3DMakeScale(0.5,0.5,1)
    UIView.animate(withDuration: 0.3, animations: {
        cell.layer.transform = CATransform3DMakeScale(1,1,1)
    },completion: { finished in
        UIView.animate(withDuration: 0.1, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    })
//    let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 1, 1)
//       cell.layer.transform = rotationTransform
//       cell.alpha = 0.5
//
//       UIView.animate(withDuration: 0.5){
//           cell.layer.transform = CATransform3DIdentity
//           cell.alpha = 1.0
//       }
}

func animatePopupView(_ cell: UIView) {
    cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
    UIView.animate(withDuration: 0.5, animations: {
        cell.layer.transform = CATransform3DMakeScale(1,1,1)
    },completion: { finished in
        UIView.animate(withDuration: 0.1, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    })
}

 func getAlertController(title : String, message : String ,style: UIAlertController.Style) ->  UIAlertController {
    let alertVc = UIAlertController.init(title: title, message: message, preferredStyle: style)
    alertVc.view.tintColor = colorPrimary
    let attrs = [kCTFontAttributeName as NSAttributedString.Key:UIFont.boldSystemFont(ofSize: 18.0),kCTForegroundColorAttributeName as NSAttributedString.Key:colorPrimary]
    let hogen = NSMutableAttributedString.init(string: title, attributes: attrs)
    alertVc.setValue(hogen,forKey: "attributedTitle")
    let attrsM  = [kCTFontAttributeName as NSAttributedString.Key:UIFont.systemFont(ofSize: 15.0) ,kCTForegroundColorAttributeName as NSAttributedString.Key:UIColor.black]
    let hogenMessage = NSMutableAttributedString.init(string: message, attributes: attrsM)
    alertVc.setValue(hogenMessage,forKey: "attributedMessage")
    return alertVc
}

  func showAlert1(targetVC: UIViewController, title: String, message: String ,style: UIAlertController.Style){
    DispatchQueue.main.async(execute: {
        let alert = getAlertController(title : title, message : message, style: style)
        alert.addAction((UIAlertAction(title: CS.Common.ok, style: .default, handler: {(action) -> Void in
        })))
        targetVC.present(alert, animated: true, completion: nil)
    })
}
 func getDate(complete date:String)-> String {
    if (date == ""){
        return date
    }
    let splitdate : [Substring] = date.split(separator: ".")
    let subString = splitdate.first!
    let newDate = String(subString)
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let dateFormatterprintLog = DateFormatter()
    dateFormatterprintLog.dateFormat = "yyyy-MM-dd"

    if let date1 = dateFormatterGet.date(from:newDate ){
        return dateFormatterprintLog.string(from:date1)
    }
    else {
        printLog(msg:"There was an error decoding the string")
    }
    return date
}
 func attributedString(str : String) -> NSAttributedString? {
    let attributes : [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0),
        NSAttributedString.Key.foregroundColor : colorPrimary,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue
    ]
    let attributedString = NSAttributedString(string: str, attributes: attributes)
    return attributedString
}

//MARK: - Load TableView Cell
func loadFromNibNamed(viewClass : AnyObject) -> UIView?
{
    let bundle = Bundle(for:type(of: viewClass))
    let nib = UINib(nibName:String(describing: viewClass.classForCoder!), bundle: bundle)
    return (nib.instantiate(withOwner: viewClass, options: nil)[0] as! UIView)
}

