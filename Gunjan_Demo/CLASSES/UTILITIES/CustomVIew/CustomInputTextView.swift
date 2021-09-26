//
//  CustomComboBoxView.swift
//  


import Foundation
import UIKit
//import TextFieldEffects

class CustomInputTextField: UIView, UITextFieldDelegate {
    
    private var labelTitle:UILabel! = nil
    var txtField:UITextField!
    var delegateApp:ViewController?
    var btnView : UIButton!
    var btnDelete:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
//        
//        backgroundColor = .white
//
//        // corner
//        layer.cornerRadius = radius
//        layer.borderWidth = borderwidth
//        layer.borderColor = UIColor.lightGray.cgColor
//        clipsToBounds = true
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelHeight = 30
    
    func initDesign(pText:String,pImageName:String,pTag:Int,pPlaceHolder:String) {

         btnDelete = UIButton (frame: CGRect (x: Int(frame.size.width) - 34, y: 8, width: labelHeight, height: labelHeight))
        btnDelete.setImage(UIImage (named: pImageName), for: .normal)
        btnDelete.tag = pTag
        self.addSubview(btnDelete)

        self.txtField = UITextField(frame: CGRect(x: 8, y: 0, width: Int(frame.size.width) - 38 , height: 45))
        self.txtField.awakeFromNib()
        self.txtField.text = pText
        self.txtField.textColor = .label
        self.txtField.delegate = self
        self.txtField.tag = pTag
        self.txtField.placeholder = pPlaceHolder
        self.txtField.isEnabled = false
        self.addSubview(self.txtField)

        btnView = UIButton (frame: CGRect (x: 0, y: 0, width: Int(frame.size.width) - 34, height: 45))
//        btnView.backgroundColor = .red
        btnView.tag = pTag
        self.addSubview(btnView)
    
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//
        layer.cornerRadius = radius
        layer.masksToBounds = true
        self.backgroundColor = .systemGray5
        // set the shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3.0
        layer.masksToBounds =  false
        
    }
  
}


class AccountView: UIView {

    private var labelTitle:UILabel! = nil
    var delegateApp:ViewController?

    var lblAmount:UILabel!
    var lblTitle:UILabel!


    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let labelHeight = 70

    func initDesign(pTitle:String,pTag:Int,pAmount:String,bgColor : UIColor) {

        self.tag = pTag

        lblTitle = UILabel (frame: CGRect (x: Y_PADDING , y: 0, width: Int(frame.width)/2 - Y_PADDING*2, height: labelHeight))
        lblTitle.text = pTitle
        lblTitle.font = UIFont (name: APP_FONT_NAME_BOLD, size: SUB_HEADER_LABEL_FONT_SIZE)
        lblTitle.lineBreakMode = .byWordWrapping
        lblTitle.textColor = .label
        lblTitle.numberOfLines = 0
        self.addSubview(lblTitle)


        lblAmount = UILabel (frame: CGRect (x: Int(frame.width)/2 , y: 0, width:  Int(frame.width)/2 - Y_PADDING*2 , height: labelHeight))
        lblAmount.text = pAmount
        lblAmount.font = UIFont (name: APP_FONT_NAME_BOLD, size: SUB_HEADER_LABEL_FONT_SIZE)
        lblAmount.textAlignment = .right
        lblAmount.lineBreakMode = .byWordWrapping
        lblAmount.numberOfLines = 0
        lblAmount.textColor = .label
        self.addSubview(self.lblAmount)

        self.backgroundColor = bgColor
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1.0

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = radius
        layer.masksToBounds = true

        // set the shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3.0
        layer.masksToBounds =  false

    }

}




