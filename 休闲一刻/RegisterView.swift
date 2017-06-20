//
//  RegisterView.swift
//  休闲一刻
//
//  Created by 5201-mac on 2017/6/17.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class RegisterView: UIView {

    override init(frame:CGRect){
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var  icanView = UIImageView(image: UIImage(named: "head"))
    
    ///提示标签
     lazy  var  username = UITextField(placeholder: "  请输入用户名", isSecureTextEntry: false,bg:UIImage(named: "textbg")!)
     lazy  var  pwd = UITextField(placeholder: "  请输入密码", isSecureTextEntry: true,bg:UIImage(named: "textbg")!)
     lazy  var  pwd2 = UITextField(placeholder: " 请重复密码", isSecureTextEntry: true,bg:UIImage(named: "textbg")!)
    ///注册按钮
    lazy var cancelBtn = UIButton(title: "取消",
                                    fontSize: 16,
                                    normalColor:UIColor.orange,
                                    highlightedColor: UIColor.darkGray,backgroundImageName:"button")
    ///登录按钮
    lazy var loginBtn = UIButton(title: "注册",
                                 fontSize: 16,
                                 normalColor:UIColor.darkGray,
                                 highlightedColor: UIColor.orange,backgroundImageName:"button")
    
    
}
extension RegisterView{
    func setupUI()
    {
        
        addSubview(icanView)
        addSubview(username)
        addSubview(pwd)
        addSubview(pwd2)
        addSubview(cancelBtn)
        addSubview(loginBtn)
        
        //2.取消 autoresizing
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
            //自动布局
            //imageview
            let margin:CGFloat = 20
            addConstraint(NSLayoutConstraint(item: icanView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: icanView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
            //textFiled
            addConstraint(NSLayoutConstraint(item: username, attribute: .centerX, relatedBy: .equal, toItem: icanView, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: username, attribute: .top, relatedBy: .equal, toItem: icanView, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: username, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 250))
            addConstraint(NSLayoutConstraint(item: username, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 30))
            
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .centerX, relatedBy: .equal, toItem: username, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .top, relatedBy: .equal, toItem: username, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 250))
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 30))
            
            addConstraint(NSLayoutConstraint(item: pwd2, attribute: .centerX, relatedBy: .equal, toItem:pwd, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: pwd2, attribute: .top, relatedBy: .equal, toItem: pwd, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: pwd2, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 250))
            addConstraint(NSLayoutConstraint(item: pwd2, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 30))
            //button
            addConstraint(NSLayoutConstraint(item: cancelBtn , attribute: .left, relatedBy: .equal, toItem: pwd2, attribute: .left, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: cancelBtn , attribute: .top, relatedBy: .equal, toItem: pwd2, attribute: .bottom, multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: cancelBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
            
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .right, relatedBy: .equal, toItem: pwd2, attribute: .right, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .top, relatedBy: .equal, toItem: pwd2, attribute: .bottom, multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
            
            
            
        }
        
        
    }
}


