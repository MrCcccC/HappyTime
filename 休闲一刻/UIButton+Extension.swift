//
//  UIButton+Extension.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/28.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

enum ButtonImagePosition : Int{
    
    case PositionTop = 0
    case Positionleft
    case PositionBottom
    case PositionRight
}

extension UILabel{
    convenience init(withText:String,fontsize:CGFloat,color:UIColor){
        self.init()
        self.text = withText
        self.font = UIFont(name: withText, size: fontsize)
        self.textColor = color
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.sizeToFit()
        
    }
   
    
}
extension UIButton
{
    /**
     imageName:图片的名字
     title：button 的名字
     type ：image 的位置
     Space ：图片文字之间的间距
     */
   convenience init (imageName:String,title:String,type:ButtonImagePosition,Space space:CGFloat)  {
         self.init()
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named:imageName), for: .normal)
        
        let imageWith :CGFloat = (self.imageView?.frame.size.width)!;
        let imageHeight :CGFloat = (self.imageView?.frame.size.height)!;
        
        var labelWidth :CGFloat = 0.0;
        var labelHeight :CGFloat = 0.0;
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);
        
        var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            break;
        case .Positionleft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
}

extension UIButton
{
    convenience init(BtnImage:String,backgroundImage:String,highLighted:String){
        self.init()
       self.setBackgroundImage(UIImage(named: backgroundImage), for: .normal)
        self.setImage(UIImage(named: BtnImage), for: .normal)
        self.setImage(UIImage(named: highLighted), for: .highlighted)
      
        self.sizeToFit()

    }
}

extension UIButton
{
    convenience init(title:String!,fontSize:CGFloat,normalColor:UIColor,highlightedColor:UIColor,backgroundImageName:String = ""){
        self.init()
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.setTitleColor(normalColor, for: .normal)
        self.setTitleColor(highlightedColor, for: .highlighted)
        self.setTitle(title, for: .normal)
        self.setBackgroundImage(UIImage(named:backgroundImageName), for: .normal)
        self.sizeToFit()
    }
    
}
//创建UIBarbuttonItem
extension UIBarButtonItem{
    convenience init(title:String,fontsize:CGFloat,target:Any?,action:Selector,isBackButton:Bool = false){
        let btn = UIButton(title:title, fontSize: fontsize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        if isBackButton{
        
            btn.setImage(UIImage(named:"tabbar_back"), for: .normal)
            btn.sizeToFit()
        }
       //self.init()实例化
    
        self.init(customView:btn)
    }
}


//创建UItextfiled
extension UITextField{
    convenience init(placeholder: String,isSecureTextEntry:Bool = false,bg:UIImage){
        self.init()
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        self.background = bg
    }
}


extension UIColor {
    
    convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    convenience init?(hexString: String, alpha: Float) {
        let set = CharacterSet.whitespacesAndNewlines
        var hex = hexString.trimmingCharacters(in: set).uppercased()
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        guard let hexVal = Int(hex, radix: 16) else {
            self.init()
            return nil
        }
        
        switch hex.characters.count {
        case 3:
            self.init(hex3: hexVal, alpha: alpha)
        case 6:
            self.init(hex6: hexVal, alpha: alpha)
        default:
            self.init()
            return nil
        }
    }
    
    convenience init?(hexNumber: Int) {
        self.init(hexNumber: hexNumber, alpha: 1.0)
    }
    
    convenience init?(hexNumber: Int, alpha: Float) {
        guard (0x000000 ... 0xFFFFFF) ~= hexNumber else {
            self.init()
            return nil
        }
        self.init(hex6: hexNumber, alpha: alpha)
    }
}

private extension UIColor {
    convenience init?(hex3: Int, alpha: Float) {
        self.init(red:   CGFloat( ((hex3 & 0xF00) >> 8).duplicate4bits() ) / 255.0,
                  green: CGFloat( ((hex3 & 0x0F0) >> 4).duplicate4bits() ) / 255.0,
                  blue:  CGFloat( ((hex3 & 0x00F) >> 0).duplicate4bits() ) / 255.0,
                  alpha: CGFloat(alpha))
    }
    
    convenience init?(hex6: Int, alpha: Float) {
        self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0,
                  alpha: CGFloat(alpha))
    }
}

private extension Int {
    func duplicate4bits() -> Int {
        return (self << 4) + self
    }
}
