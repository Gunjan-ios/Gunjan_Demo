//
//  CustomLabel.swift
//  


import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .left
        self.backgroundColor = .clear
        // title color
        
        self.textColor = .label
        // font
        self.font = UIFont (name: APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true

//        self.layer.cornerRadius = radius
//        self.layer.borderColor =  UIColor.lightGray.cgColor
//        self.layer.borderWidth = borderWidth
//        self.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);

//        let border = CALayer()
//        let lineWidth = CGFloat(0.5)
//        border.borderColor = UIColor.black.cgColor
//        border.frame = CGRect(x: 0, y: frame.size.height - lineWidth, width:  frame.size.width, height: frame.size.height)
//        border.borderWidth = lineWidth
//        layer.addSublayer(border)
//        layer.masksToBounds = true

    }
    func dynamicHeight(text :String) -> Int{
        let hValue : CGFloat = 0
        self.frame.size.height = hValue
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.text = text
        self.sizeToFit()

        if Int(self.frame.height) < LABEL_CELL_HEIGHT  {
            return LABEL_CELL_HEIGHT
        }
        else{
            return Int(self.frame.height)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var topInset: CGFloat = 0.0
    var bottomInset: CGFloat = 0.0
    var leftInset: CGFloat = 0.0
    var rightInset: CGFloat = 0.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
