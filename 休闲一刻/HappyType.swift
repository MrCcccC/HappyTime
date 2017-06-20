//
//  HappyType.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/17.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
//top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚)
class HappyType: UIView {
    override init(frame:CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //懒加载两个按钮
    lazy var HappyText = UIButton(title: "头条", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var HappyImage = UIButton(title: "时尚", fontSize:20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var shehui = UIButton(title: "社会", fontSize:20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var guonei = UIButton(title: "国内", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var guoji = UIButton(title: "国际", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var tiyu = UIButton(title: "体育", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var junshi = UIButton(title: "军事", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
     lazy var caijing = UIButton(title: "财经", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
    lazy var yule = UIButton(title: "娱乐", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
     lazy var keji = UIButton(title: "科技", fontSize: 20, normalColor: UIColor.white, highlightedColor: UIColor.orange, backgroundImageName: "")
}
extension HappyType{
    
    func setupUI()
   {
    addSubview(HappyText)
    addSubview(HappyImage)
    addSubview(yule)
    addSubview(junshi)
    addSubview(guoji)
    addSubview(guonei)
    addSubview(keji)
    addSubview(shehui)
    addSubview(caijing)
     addSubview(tiyu)
    
    for v in subviews{
        v.translatesAutoresizingMaskIntoConstraints = false
    
        //HappyText的位置
        addConstraint(NSLayoutConstraint(item: HappyText, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: HappyText, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -20))
        addConstraint(NSLayoutConstraint(item: HappyText, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        HappyText.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: junshi, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item:junshi, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        addConstraint(NSLayoutConstraint(item:junshi, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        junshi.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: yule, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item:yule, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -100))
        addConstraint(NSLayoutConstraint(item:yule, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        yule.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: keji, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item:keji, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -140))
        addConstraint(NSLayoutConstraint(item:keji, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        keji.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: guoji, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item:guoji, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -180))
        addConstraint(NSLayoutConstraint(item:guoji, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        guoji.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
         //HappyIamge的位置
        addConstraint(NSLayoutConstraint(item: HappyImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: HappyImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 20))
        addConstraint(NSLayoutConstraint(item: HappyImage, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        HappyImage.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: guonei, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: guonei, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 60))
        addConstraint(NSLayoutConstraint(item: guonei, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        guonei.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: tiyu, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: tiyu, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: tiyu, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        tiyu.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: caijing, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item:  caijing, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 140))
        addConstraint(NSLayoutConstraint(item:  caijing, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        caijing.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        addConstraint(NSLayoutConstraint(item: shehui, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: shehui, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 180))
        addConstraint(NSLayoutConstraint(item: shehui, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
        shehui.addTarget(self, action: #selector(text(name:)), for: .touchUpInside)
        
        }
    
    }
    func text(name:UIButton){

        let top = "头条"
        let shehui = "社会"
        let guonei = "国内"
        let guoji = "国际"
        let yule = "娱乐"
        let tiyu = "体育"
        let junshi = "军事"
        let keji = "科技"
        let caijing = "财经"
        //let shishang = "时尚"
        typeName = (name.titleLabel?.text)!
        guard let ban = name.titleLabel?.text else {
            return
        }
        
        switch ban {
        case top:
            type = "top"
        case shehui:
            type = "shehui"
        case guonei:
            type = "guonei"
        case guoji :
            type = "guoji"
        case tiyu:
            type = "tiyu"
        case yule:
            type = "yule"
        case junshi:
            type = "junshi"
        case keji:
            type = "keji"
        case caijing:
            type = "caijing"
        default:
            type = "shishang"
            
        }
    
    
    }
}
