//
//  ConsView.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/13.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class ConsView: UIView {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupUI()
        
    }
    lazy var ConsLabel = UILabel(withText: "星座名", fontsize: 16, color: UIColor.darkGray)
    lazy var DateLabel = UILabel(withText: "日期", fontsize: 16, color: UIColor.darkGray)
    lazy var ConsButton = UIButton(title: "请选择", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.darkGray, backgroundImageName: "button")
    lazy var DateButton = UIButton(title: "请选择", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.darkGray, backgroundImageName: "button")
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupUI(){
        addSubview(ConsLabel)
        addSubview(DateLabel)
        addSubview(ConsButton)
        addSubview(DateButton)
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
            //自动布局
            //imageview
          
            
            
            
        }

        
        
        
    }
    
    

}
