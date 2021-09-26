//
//  CustomComboBoxView.swift
//  


import UIKit
import SwiftyJSON

class CustomComboBoxView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    private var labelTitle:UILabel! = nil
    let pickerView = DropDownPickerView()
    var txtField:CustomTextFieldForAttribute!
     var datePickerView:UIDatePicker? = nil
    var delegateApp:ViewController?

    let txtFieldHeight = 60
    var ptag: Int! = 0

    func initDesign(pName:String,pTag:Int,pOptions:[String],pPlaceHolder:String) {

        ptag = pTag
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.backgroundColor = UIColor.label
        toolBar.isTranslucent = true
        toolBar.tintColor = colorPrimary
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePressedForForDropDownTypePickerView(sender:)))
        doneButton.tag = 5000 + pTag
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        pickerView.tag = 5000 + pTag

        let dropDownOptions = pOptions
        printLog(msg:pOptions)
        pickerView.pickerOptions = dropDownOptions
        pickerView.delegate = self as UIPickerViewDelegate
        self.txtField = CustomTextFieldForAttribute(frame: CGRect(x: 0, y: 0, width: Int(frame.size.width), height: txtFieldHeight))
        self.txtField.delegate = self as UITextFieldDelegate
        self.txtField.tag = pTag
        self.txtField.returnKeyType = .done
        self.txtField.placeholder = pPlaceHolder
        self.txtField.attributedPlaceholder = NSAttributedString(string: pPlaceHolder,
                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.txtField.inputView = pickerView
        self.txtField.inputAccessoryView = toolBar
        self.txtField.imgIcon.frame = CGRect(x: Int(frame.size.width) - 50, y: 0, width: txtFieldHeight, height: txtFieldHeight)
        self.txtField.imgIcon.image = UIImage(systemName: DATATYPE_DROPDOWN_ICON)
        self.addSubview(self.txtField)

        pickerView.currentTextField = txtField
    }

    //MARK:- Date Picker
    func setDatePicker() {

        self.pickerView.isHidden = true

        // for date picker
        self.datePickerView = UIDatePicker()
        self.datePickerView!.datePickerMode = UIDatePicker.Mode.date
        self.datePickerView!.maximumDate = Date()

        self.datePickerView!.addTarget(self, action: #selector(datePickerForDateValueChanged(sender:)), for: .valueChanged)
        self.txtField.inputView = self.datePickerView
        if #available(iOS 14.0, *) {
            self.datePickerView!.preferredDatePickerStyle = .inline
        }
        // for done button
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = colorPrimary
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePressedForDateTypePickerView(sender:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.txtField.inputAccessoryView = toolBar

    }

    @objc private func datePickerForDateValueChanged(sender:UIDatePicker) {

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormatDisplay
            self.txtField.text = dateFormatter.string(from: sender.date)
    }

    @objc func donePressedForDateTypePickerView(sender:UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dtPicker = self.txtField.inputView as! UIDatePicker
        self.txtField.text = dateFormatter.string(from: dtPicker.date)
        self.txtField.resignFirstResponder()
    }



    //MARK:- Dropdown delegate
    @objc func donePressedForForDropDownTypePickerView(sender:UIBarButtonItem) {
        if pickerView.pickerOptions.count > 0 {
            self.txtField.text = self.pickerView.pickerOptions[self.pickerView.selectedRow(inComponent: 0)]
            self.txtField.resignFirstResponder()
        }
//        if let delegate = self.delegateAccount {
//            if ptag == tag3001{
//                delegate.selectUserType(strUserType: txtField.text!, pTag: ptag)
//            }
//        }
    }

    // MARK: UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let pickerView = pickerView as! DropDownPickerView
        return pickerView.pickerOptions.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pickerView = pickerView as! DropDownPickerView
        return pickerView.pickerOptions[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //  self.selectedIndexForPickerView = row
        let pickerView = pickerView as! DropDownPickerView
        pickerView.currentTextField.text = pickerView.pickerOptions[row]
    }

    //MARK: textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if let delegate = self.delegateAccount {
//            if ptag == tag3001{
//                delegate.selectUserType(strUserType: textField.text!, pTag: ptag)
//            }
//        }
//    }
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        if let delegate = self.delegateAccount {
//            if ptag == tag3001{
//                delegate.selectUserType(strUserType: textField.text!, pTag: ptag)
//            }
//        }
//    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let delegate = self.delegateApp {
//            delegate.selectUserType(strUserType: textField.text!, pTag: ptag)
        }

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let delegate = self.delegateApp {
        }
    }
}
class AccountComboBoxView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    private var labelTitle:UILabel! = nil
    let pickerView = DropDownPickerView()
    var txtField:CustomTextFieldForAttribute!
    var datePickerView:UIDatePicker? = nil
    var delegateApp:ViewController?

    let txtFieldHeight = 60
    var ptag: Int! = 0

    func initDesign(pName:String,pTag:Int,pOptions:[JSON],pPlaceHolder:String) {

        ptag = pTag
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.backgroundColor = UIColor.label
        toolBar.isTranslucent = true
        toolBar.tintColor = colorPrimary
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePressedForForDropDownTypePickerView(sender:)))
        doneButton.tag = 5000 + pTag
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        pickerView.tag = 5000 + pTag

        let dropDownOptions = pOptions
        printLog(msg:pOptions)
        pickerView.accountOptions = dropDownOptions
        pickerView.delegate = self as UIPickerViewDelegate
        self.txtField = CustomTextFieldForAttribute(frame: CGRect(x: 0, y: 0, width: Int(frame.size.width), height: txtFieldHeight))
        self.txtField.delegate = self as UITextFieldDelegate
        self.txtField.tag = pTag
        self.txtField.returnKeyType = .done
        self.txtField.placeholder = pPlaceHolder
        self.txtField.attributedPlaceholder = NSAttributedString(string: pPlaceHolder,
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.txtField.inputView = pickerView
        self.txtField.inputAccessoryView = toolBar
        self.txtField.imgIcon.frame = CGRect(x: Int(frame.size.width) - 50, y: 0, width: txtFieldHeight, height: txtFieldHeight)
        self.txtField.imgIcon.image = UIImage(systemName: DATATYPE_DROPDOWN_ICON)
        self.addSubview(self.txtField)

        pickerView.currentTextField = txtField
    }

    //MARK:- Date Picker
    func setDatePicker() {

        self.pickerView.isHidden = true

        // for date picker
        self.datePickerView = UIDatePicker()
        self.datePickerView!.datePickerMode = UIDatePicker.Mode.date
        self.datePickerView!.maximumDate = Date()

        self.datePickerView!.addTarget(self, action: #selector(datePickerForDateValueChanged(sender:)), for: .valueChanged)
        self.txtField.inputView = self.datePickerView
        if #available(iOS 14.0, *) {
            self.datePickerView!.preferredDatePickerStyle = .inline
        }
        // for done button
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = colorPrimary
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePressedForDateTypePickerView(sender:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.txtField.inputAccessoryView = toolBar

    }

    @objc private func datePickerForDateValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatDisplay
        self.txtField.text = dateFormatter.string(from: sender.date)
    }

    @objc func donePressedForDateTypePickerView(sender:UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dtPicker = self.txtField.inputView as! UIDatePicker
        self.txtField.text = dateFormatter.string(from: dtPicker.date)
        self.txtField.resignFirstResponder()
    }



    //MARK:- Dropdown delegate
    @objc func donePressedForForDropDownTypePickerView(sender:UIBarButtonItem) {

        if pickerView.accountOptions.count > 0 {
//          self.txtField.text = self.pickerView.accountOptions[self.pickerView.selectedRow(inComponent: 0)]["categoryName"].stringValue
            pickerView.accountSelectedOptions = self.pickerView.accountOptions[self.pickerView.selectedRow(inComponent: 0)]
        }
        self.txtField.resignFirstResponder()
        //        if let delegate = self.delegateAccount {
        //            if ptag == tag3001{
        //                delegate.selectUserType(strUserType: txtField.text!, pTag: ptag)
        //            }
        //        }
    }

    // MARK: UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let pickerView = pickerView as! DropDownPickerView
        return pickerView.accountOptions.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pickerView = pickerView as! DropDownPickerView
            return pickerView.accountOptions[row]["categoryName"].stringValue

    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //  self.selectedIndexForPickerView = row
        let pickerView = pickerView as! DropDownPickerView
        pickerView.currentTextField.text = pickerView.accountOptions[row]["categoryName"].stringValue
    }

    //MARK: textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let delegate = self.delegateApp {
//            delegate.selectCompanyORcategory(pTag: ptag, selectData: pickerView.accountSelectedOptions)
        }

    }
}
