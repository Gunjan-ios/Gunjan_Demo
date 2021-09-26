//
//  CustomButton.swift
//
//


import UIKit

class CustomButton : UIButton {
    
    private var shadowLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = colorPrimary
        self.contentHorizontalAlignment = .center
        setTitleColor(.white, for: .normal)
        
        // corner
        layer.cornerRadius = radius
//        layer.borderWidth = borderwidth
//        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
        
        // font
        titleLabel?.font = UIFont(name:APP_FONT_NAME, size: LABEL_FONT_SIZE)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//
        layer.cornerRadius = radius
        layer.masksToBounds = true

        // set the shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3.0
        layer.masksToBounds =  false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}



class CheckButton : UIButton {
    
    private var shadowLayer: CAShapeLayer!
    var img : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = backgroundColor
        self.contentHorizontalAlignment = .left
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.numberOfLines = 0
        setTitleColor(colorPrimary, for: .normal)
        self.setImage(UIImage(named: "deselectedCheckbox"), for: .normal)
        self.setImage(UIImage(named: "selectedCheckboxBlue1"), for: .selected)
        
        self.layer.cornerRadius = radius
        // corner
       
        // font
        titleLabel?.font = UIFont(name:APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
    
        self.imageEdgeInsets = UIEdgeInsets (top: 0, left: 8, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets (top: 0, left: 15, bottom: 0, right: 0)
        
      

        //  shadow
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 5).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
        }
    }
    
    func initBottomLine() {
        let border = CALayer()
        let lineWidth = CGFloat(0.5)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - lineWidth, width:  frame.size.width, height: frame.size.height)
        border.borderWidth = lineWidth
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
