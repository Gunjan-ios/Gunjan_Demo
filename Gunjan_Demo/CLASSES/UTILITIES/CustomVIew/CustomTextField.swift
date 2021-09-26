//
//  CustomTextField.swift
//  


import Foundation
import UIKit

class CustomTextField : UITextField {
    
    let padding: CGFloat = 8
    var boxBorderColor = UIColor.lightGray.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderwidth
        self.backgroundColor = .clear
        self.font = UIFont(name: APP_FONT_NAME, size: TEXTFIELD_FONT_SIZE)
        self.textColor = .black

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //  Padding x
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0))
    }
    
}

