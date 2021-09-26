//
//  GenderView.swift
//  PRE_Prominent


import UIKit
import DLRadioButton

class RadioSelectView : UIView {

    private var labelTitle:UILabel! = nil
    private var btnNo:UIButton!
    private var btnYes:UIButton!
    private var btnGender:UIButton!
    var delegateEditInventory:EditInventoryViewController?
//    var PreviewdelegateApp:PreviewViewController?
//    var verificationDelegateApp:VerificationDetailViewController?
    var isMarginMoneyCallback = false
    var newHeigt : CGFloat = 70
    let labelHeight = 30
    let radioBtnHeight = 30
    var delegatereciept:AddEditRecieptViewController?


    func initDesign(pName:String,pTag:Int,pOptions:[String],selected:String) {

        labelTitle = CustomLabel(frame: CGRect(x: Y_PADDING, y: 0, width: Int(frame.size.width), height: labelHeight))
        labelTitle.textColor = .label
        labelTitle.font = UIFont(name: APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
        labelTitle.text = pName
        labelTitle.textAlignment = .left
        self.addSubview(labelTitle)

        let labelVIew = UIView(frame: CGRect(x: 0, y: labelHeight , width: Int(frame.size.width), height: 1))
        labelVIew.backgroundColor = .lightGray
        self.addSubview(labelVIew)

        var otherButtons : [DLRadioButton] = [];

        let firstRadioButton = self.createRadioButton(frame: CGRect(x: 8, y: labelHeight + 1 , width: SCREEN_WIDTH, height: radioBtnHeight), title: pOptions[0], color: UIColor.label, view: self);
        printLog(msg:firstRadioButton.frame)
        firstRadioButton.tag = pTag
        if firstRadioButton.titleLabel?.text == selected{
            firstRadioButton.isSelected = true
        }

        self.isMarginMoneyCallback = false

        var index = 0
        var x_Spacing = labelHeight

        for name in pOptions {
            if index == 0 {
                index+=1
                continue
            }

            x_Spacing += radioBtnHeight + Y_PADDING

            let frame = CGRect(x: 8, y: x_Spacing, width: SCREEN_WIDTH, height: radioBtnHeight);
            printLog(msg:frame)
            let radioButton = createRadioButton(frame: frame, title: name, color: UIColor.label,view: self);

            if name == selected{
                radioButton.isSelected = true
            }
            otherButtons.append(radioButton);
        }

        firstRadioButton.otherButtons = otherButtons;
        printLog(msg: firstRadioButton.otherButtons.count + 1)
        let size = radioBtnHeight*(firstRadioButton.otherButtons.count+1)
        newHeigt = CGFloat(labelHeight + size)

    }

    func resetHeight()  -> CGRect {
           return  CGRect (x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newHeigt)
    }

    private func createRadioButton(frame : CGRect, title : String, color : UIColor, view:UIView) -> DLRadioButton {

        let radioButton = DLRadioButton(frame: frame);
        radioButton.titleLabel!.font = UIFont.init(name: APP_FONT_NAME_MEDIUM, size: LABEL_FONT_SIZE)
        radioButton.setTitle(title, for: []);
        radioButton.setTitleColor(color, for: []);
        radioButton.iconColor = color;
        radioButton.indicatorColor = color;
        radioButton.icon = UIImage(named: "radioBtnOff")!
        radioButton.iconSelected = UIImage(named: "radioBtnOnBlue")!
        radioButton.titleEdgeInsets = UIEdgeInsets (top: 0, left: 8, bottom: 0, right: 0)
        radioButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left;
        radioButton.addTarget(self, action: #selector(self.logSelectedButton(radioButton:)), for: UIControl.Event.touchUpInside);
        radioButton.isMultipleSelectionEnabled = false
        
        view.addSubview(radioButton);

        return radioButton;
    }

    //MARK:- Others
    @objc private func logSelectedButton(radioButton : DLRadioButton) {

        if let delegate =  delegateEditInventory  {
                 printLog(msg:String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
            delegate.chagesInLocatedStatus(str: (radioButton.selected()?.titleLabel?.text)!)
        }
        if let delegate =  delegatereciept  {
                 printLog(msg:String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
            delegate.chagesInLocatedStatus(str: (radioButton.selected()?.titleLabel?.text)!)
        }
    }
}

