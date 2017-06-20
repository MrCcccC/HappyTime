//
//  HomeView.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/13.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
 var GameBtn = UIButton(title: "问答",
                            fontSize: 16,
                            normalColor:UIColor.white,
                            highlightedColor: UIColor.orange,backgroundImageName:"5")



 var HeathBtn = UIButton(title: "XX",
                             fontSize: 16,
                             normalColor:UIColor.white,
                             highlightedColor: UIColor.orange,backgroundImageName:"4")
 var HappyBtn = UIButton(title: "XX",
                             fontSize: 16,
                             normalColor:UIColor.white,
                             highlightedColor: UIColor.orange,backgroundImageName:"3")

var MineBtn = UIButton(title: "XX",
                            fontSize: 16,
                            normalColor:UIColor.white,
                            highlightedColor: UIColor.orange,backgroundImageName:"1")

 var MapBtn = UIButton(title: "XX",
                           fontSize: 16,
                           normalColor:UIColor.white,
                           highlightedColor: UIColor.orange,backgroundImageName:"2")

class HomeView: UIView {
    //初始化
    override init(frame:CGRect){
        super.init(frame: frame)
        setupUI()
        
    }
    //懒加载各个按钮
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //创建按钮视图
    func setupUI()
    {
        //添加按钮
        addSubview(GameBtn)
        addSubview(HeathBtn)
        addSubview(HappyBtn)
        addSubview(MineBtn)
        addSubview(MapBtn)
        //取消自动布局
        GameBtn.titleEdgeInsets = .init(top: 60, left: 10, bottom: -40, right: 10)
        HeathBtn.titleEdgeInsets = .init(top: 60, left: 10, bottom: -40, right: 10)
        HappyBtn.titleEdgeInsets = .init(top: 60, left: 10, bottom: -40, right: 10)
        MineBtn.titleEdgeInsets = .init(top: 60, left: 10, bottom: -40, right: 10)
        MapBtn.titleEdgeInsets = .init(top: 60, left: 10, bottom: -40, right: 10)
        
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
            
            //设置按钮的位置与大小
            //GameBtn
            addConstraint(NSLayoutConstraint(item: GameBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: GameBtn, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: GameBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 75))
            addConstraint(NSLayoutConstraint(item: GameBtn, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 81))
            
            //MimeBtn
        
             addConstraint(NSLayoutConstraint(item: MineBtn, attribute: .centerX, relatedBy: .equal, toItem: GameBtn, attribute: .centerX, multiplier: 1.0, constant: -110))
             addConstraint(NSLayoutConstraint(item: MineBtn, attribute: .centerY, relatedBy: .equal, toItem: GameBtn, attribute: .centerY, multiplier: 1.0, constant: -100))
            addConstraint(NSLayoutConstraint(item: MineBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 75))
            addConstraint(NSLayoutConstraint(item: MineBtn, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 81))
            
            //MapBtn
            addConstraint(NSLayoutConstraint(item: MapBtn, attribute: .centerX, relatedBy: .equal, toItem: GameBtn, attribute: .centerX, multiplier: 1.0, constant: 110))
            addConstraint(NSLayoutConstraint(item: MapBtn, attribute: .centerY, relatedBy: .equal, toItem: GameBtn, attribute: .centerY, multiplier: 1.0, constant: -100))
            addConstraint(NSLayoutConstraint(item: MapBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 75))
            addConstraint(NSLayoutConstraint(item: MapBtn, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 81))
            
            //HealthBtn
            addConstraint(NSLayoutConstraint(item: HeathBtn, attribute: .centerX, relatedBy: .equal, toItem: GameBtn, attribute: .centerX, multiplier: 1.0, constant: 110))
            addConstraint(NSLayoutConstraint(item: HeathBtn, attribute: .centerY, relatedBy: .equal, toItem: GameBtn, attribute: .centerY, multiplier: 1.0, constant: 100))
            addConstraint(NSLayoutConstraint(item: HeathBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 75))
            addConstraint(NSLayoutConstraint(item: HeathBtn, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 81))
            
            //HappyBtn
            addConstraint(NSLayoutConstraint(item: HappyBtn, attribute: .centerX, relatedBy: .equal, toItem: GameBtn, attribute: .centerX, multiplier: 1.0, constant: -110))
            addConstraint(NSLayoutConstraint(item: HappyBtn, attribute: .centerY, relatedBy: .equal, toItem: GameBtn, attribute: .centerY, multiplier: 1.0, constant: 100))
            addConstraint(NSLayoutConstraint(item: HappyBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 75))
            addConstraint(NSLayoutConstraint(item: HappyBtn, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 81))
        }
    }

    
    
}
