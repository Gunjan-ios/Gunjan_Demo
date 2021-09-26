//
//  MaterialTextfiled.swift
//  


import UIKit
import MaterialComponents



extension  MDCOutlinedTextField {


    func InitDesign(pImageName:String,PInfoText:String,pPlaceHolder:String){

        let labelHeight = 25
        placeholder = pPlaceHolder
        label.text = placeholder
        if PInfoText != "" {
            text = PInfoText
            placeholder = ""
        }

        clearButtonMode = .always

        let imgView = UIImageView (frame: CGRect (x: 5, y: 15 , width: labelHeight, height: labelHeight))
        imgView.image = UIImage (named: pImageName)
        imgView.setImageColor(color: colorPrimary)
        //        self.addSubview(imgView)
        self.leadingView = imgView
        self.leadingViewMode = .always
        //        self.leftView?.addSubview(imgView)
        //        self.leftViewMode = .always

    }

    //  Padding x
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 35))
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 35))
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 35))
    }
}
//}
extension  MDCOutlinedTextArea {
   

   func InitDesign(PInfoText:String,pPlaceHolder:String){
       
       label.text = PInfoText
       placeholder = pPlaceHolder

       setOutlineColor(.label, for:.normal)
       setTextColor(.label, for: .disabled)
        setNormalLabel(.gray, for: .normal)
        setFloatingLabel(.darkGray, for: .normal)

    setOutlineColor(.systemBlue, for:.editing)
    setTextColor(.systemBlue, for: .editing)
        setFloatingLabel(.darkGray, for: .editing)
       maximumNumberOfVisibleRows = 2
       //font = UIFont(name: APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
//       font = UIFont.systemFont(ofSize: 17.0)

       }
   
   func requiredText(pText : String){
       let passwordAttriburedString = NSMutableAttributedString(string: pText)
       let asterix = NSAttributedString(string: " *", attributes: [.foregroundColor: UIColor.red])
          passwordAttriburedString.append(asterix)
       label.attributedText = passwordAttriburedString
   }
   

//  Padding x
//    override public func textRect(forBounds bounds: CGRect) -> CGRect {
//        // let newCGRect = bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
//        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
//    }
//
//    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
//    }
//
//    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
//    }
   }
//}
