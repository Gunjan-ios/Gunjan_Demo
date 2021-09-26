//
//  RoundedView.swift
//  PRE_Prominent
//
//  Created by samaj47 on 11/12/20.
//

import UIKit

//class RoundedView: UIView {
//
//        override func awakeFromNib() {
//           super.awakeFromNib()
//            layer.cornerRadius = 6.0
//            layer.masksToBounds = true
//
//            // set the shadow properties
//            layer.shadowColor = UIColor.black.cgColor
//            layer.shadowOffset = .zero
//            layer.shadowOpacity = 0.3
//            layer.shadowRadius = 3.0
//            layer.masksToBounds =  false
//           //custom logic goes here
//        }
//        required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//        }
//
//}
class RoundedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
    }
    override func awakeFromNib() {
       super.awakeFromNib()
        layer.cornerRadius = 6.0
        layer.masksToBounds = true

        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor

        // set the shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2.0
        layer.masksToBounds =  false
       //custom logic goes here
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}

class ThemeLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
    }
    override func awakeFromNib() {
        self.textAlignment = .left
        self.backgroundColor = .clear
        // title color
        self.textColor = .systemBlue
        // font
        self.font = UIFont (name: APP_FONT_NAME_MEDIUM, size: TABLECELL_TITLE_FONTSIZE)
        lineBreakMode = .byWordWrapping
        numberOfLines = 0

       super.awakeFromNib()
//        layer.cornerRadius = 6.0
//        layer.masksToBounds = true
//
//        // set the shadow properties
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.shadowOpacity = 0.3
//        layer.shadowRadius = 3.0
//        layer.masksToBounds =  false
       //custom logic goes here
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}
