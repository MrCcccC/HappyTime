//
//  VisitorView.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/29.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    //访客视图的信息字典
    //MARK - 设置访客视图信息
    //使用字典设置访客视图信息
    //dict[imgaName/message]
    ///如果是是首页，imagename = “”
    var visitorInfo:[String:String]?{
        didSet{
            //取字典信息
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"] else{
                    return
            }
            
            //设置消息
            tipLabel.text = message
            if imageName == "" {
                startAnimation()
                return
            }
            icanView.image = UIImage(named: imageName)
        }
    }
    
    
    //设置旋转动画
    func startAnimation(){
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        anim.isRemovedOnCompletion = false
        icanView.layer.add(anim, forKey: nil)
        
    }
    
    
    
    
//  构造函数
    override init(frame:CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - 私有控件
    ///图像视图
    lazy var  icanView = UIImageView(image: UIImage(named: "home"))
    
    ///提示标签
    lazy var tipLabel = UILabel(withText: "关注一些人，回这里看看有什么惊喜",
                                fontsize: 14,
                                color: UIColor.darkGray)
    ///注册按钮
    lazy var registerBtn = UIButton(title: "注册",
                                    fontSize: 16,
                                    normalColor:UIColor.orange,
                                    highlightedColor: UIColor.darkGray,backgroundImageName:"button")
    ///登录按钮
    lazy var loginBtn = UIButton(title: "登录",
                                 fontSize: 16,
                                 normalColor:UIColor.darkGray,
                                 highlightedColor: UIColor.orange,backgroundImageName:"button")
}
//MARK - 设置界面
extension VisitorView{
    func setupUI(){
        backgroundColor = UIColor(hexNumber: 0xEDEDED)
        
        //添加空间
        addSubview(icanView)
        addSubview(tipLabel)
        addSubview(registerBtn)
        addSubview(loginBtn)
       
        //2.取消 autoresizing 
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        //自动布局
            //imageview
            let margin:CGFloat = 20
            addConstraint(NSLayoutConstraint(item: icanView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: icanView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
          //label
            addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .centerX, relatedBy: .equal, toItem: icanView, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .top, relatedBy: .equal, toItem: icanView, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 280))
            //button
            addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .left, relatedBy: .equal, toItem: tipLabel, attribute: .left, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: margin))
             addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
            
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .right, relatedBy: .equal, toItem: tipLabel, attribute: .right, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))

            
            
        }
        
    }
}

