//
//  CustomTextField.swift
//  


import Foundation
import UIKit
import TextFieldEffects

class InputTextField : ACFloatingTextfield {
    
    let padding: CGFloat = CGFloat(4)
    var boxBorderColor = UIColor.lightGray.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: APP_FONT_NAME_MEDIUM, size: 17)
        textColor = colorPrimary
        boxBorderColor = colorPrimary.cgColor

//        borderInactiveColor = .darkGray
//        borderActiveColor = colorPrimary
        
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func requiredText(pText : String){
        let passwordAttriburedString = NSMutableAttributedString(string: pText)
        let asterix = NSAttributedString(string: " *", attributes: [.foregroundColor: UIColor.red])
           passwordAttriburedString.append(asterix)
        attributedPlaceholder = passwordAttriburedString
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //  Padding x
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // let newCGRect = bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
}
