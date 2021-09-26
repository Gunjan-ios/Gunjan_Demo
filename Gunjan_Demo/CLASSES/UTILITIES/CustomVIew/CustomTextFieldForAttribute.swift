//
//  CustomTextField.swift
//  

import UIKit
import MaterialComponents
class CustomTextFieldForAttribute: UITextField {
    
    var imgIcon:UIImageView!
    let padding: CGFloat = 8
    var boxBorderColor = UIColor.label

    override init(frame: CGRect) {
        super.init(frame: frame)
        imgIcon = UIImageView(frame: CGRect(x: self.bounds.size.width - 44, y: 7, width: 24, height: 24))

        self.imgIcon.contentMode = .center
        self.addSubview(imgIcon)
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderwidth
        self.backgroundColor = .clear
        self.font = UIFont(name: APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
        self.textColor = .label
        
//        let border = CALayer()
//        let lineWidth = CGFloat(1)
//        border.borderColor = colorDividerBG_f4.cgColor
//        border.frame = CGRect(x: 0, y: frame.size.height - lineWidth, width:  frame.size.width, height: frame.size.height)
//        border.borderWidth = lineWidth
//        layer.addSublayer(border)
//        layer.masksToBounds = true
//        self.backgroundColor = .clear
//        self.font = UIFont(name: APP_FONT_NAME, size: SHARE_BUTTON_FONT_SIZE)
//        self.textAlignment = .left
//        self.textColor = UIColor.black
      
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //  Padding x
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // let newCGRect = bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
    
   
}
