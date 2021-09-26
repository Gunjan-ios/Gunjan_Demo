//
//  GenderView.swift
//  
//


import Foundation
import UIKit
import DLRadioButton

class RadioView : UIView {

    private var labelTitle:UILabel! = nil
    private var btnMale:UIButton!
    private var btnFeMale:UIButton!
    private var btnGender:UIButton!
    var delegateApp:ViewController?

    var newHeigt : CGFloat = 70
    var newWidth : Int = 70
    var btnTag : Int!
    let labelHeight = 25
    let radioBtnHeight = 45

    func initDesign(pName:String,pTag:Int,pOptions:[String],selected:String) {

        btnTag = pTag
        labelTitle = CustomLabel(frame: CGRect(x: Y_PADDING, y: 0, width: Int(frame.size.width), height: labelHeight))
        labelTitle.textColor = colorPrimary
        labelTitle.font = UIFont(name: APP_FONT_NAME_MEDIUM, size: 15.0)
        labelTitle.text = pName
        labelTitle.textAlignment = .left
        self.addSubview(labelTitle)
        
        let labelVIew = UIView(frame: CGRect(x: 0, y: labelHeight , width: Int(frame.size.width), height: 1))
        labelVIew.backgroundColor = .gray
        self.addSubview(labelVIew)
        
        var otherButtons : [DLRadioButton] = [];
        
        switch pTag {
        case 1:
            newWidth = 70
        case 2:
            newWidth = 100
        case 3:
            newWidth = 100
        case 4:
                newWidth = 115
        default:
            newWidth = 70
        }
        
        
        let firstRadioButton = self.createRadioButton(frame: CGRect(x: Y_PADDING, y: labelHeight, width: newWidth, height: radioBtnHeight), title: pOptions[0], color: .systemBlue, view: self);
        printLog(msg:firstRadioButton.frame)
        firstRadioButton.tag = pTag
        if firstRadioButton.titleLabel?.text == selected{
            firstRadioButton.isSelected = true
        }
        var index = 0
        var x_Spacing = 0
        
        for name in pOptions {
            if index == 0 {
                index+=1
                continue
            }
            
            x_Spacing += newWidth
            
            let frame = CGRect(x: x_Spacing, y: labelHeight , width: newWidth, height: radioBtnHeight);
            printLog(msg:frame)
            
            let radioButton = createRadioButton(frame: frame, title: name, color: .systemBlue ,view: self);
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
        radioButton.titleLabel!.font = UIFont.systemFont(ofSize: 14);
        radioButton.setTitle(title, for: []);
        radioButton.setTitleColor(color, for: []);
        radioButton.iconColor = color;
        radioButton.indicatorColor = color;
        radioButton.icon = UIImage(named: "radioBtnOff")!
        radioButton.iconSelected = UIImage(named: "radioBtnOnBlue")!
        radioButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left;
        radioButton.addTarget(self, action: #selector(self.logSelectedButton(radioButton:)), for: UIControl.Event.touchUpInside);
        view.addSubview(radioButton);

        return radioButton;
    }

    //MARK:- Others
    @objc private func logSelectedButton(radioButton : DLRadioButton) {

        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                printLog(msg:String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        }
       else if let delegate =  delegateApp  {
                 printLog(msg:String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
//            delegate.chagesInLocatedStatus(str: (radioButton.selected()?.titleLabel?.text)!)
        }else {
//            delegateApp?.radiobtnSelection(str_text: radioButton.selected()!.titleLabel!.text!, tag: btnTag)
//            printLog(msg:String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
    }
}


