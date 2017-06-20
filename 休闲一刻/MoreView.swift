//
//  MoreView.swift
//  休闲一刻
//
//  Created by 5201-mac on 2017/6/7.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class MoreView: UIView {

    override init(frame:CGRect){
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var content = UILabel(withText: "\(Dict["happy"] ?? "无")", fontsize: 13, color: UIColor.black)
    
    func setUI(){
        //添加视图
        addSubview(content)
        content.numberOfLines = 20
        content.sizeToFit()
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
            addConstraint(NSLayoutConstraint(item: content, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: content, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: content , attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 270))
            addConstraint(NSLayoutConstraint(item: content , attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 340))
        }
    }
}
