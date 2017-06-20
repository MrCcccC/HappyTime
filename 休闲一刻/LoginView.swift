//
//  LoginView.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/30.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class LoginView: UIView {

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
extension LoginView{
    func setupUI()
    {
        
        addSubview(icanView)
        addSubview(username)
        addSubview(pwd)
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
            //textFiled
            addConstraint(NSLayoutConstraint(item: username, attribute: .centerX, relatedBy: .equal, toItem: icanView, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: username, attribute: .top, relatedBy: .equal, toItem: icanView, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: username, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 250))
             addConstraint(NSLayoutConstraint(item: username, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 30))
            
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .centerX, relatedBy: .equal, toItem: username, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .top, relatedBy: .equal, toItem: username, attribute: .bottom ,multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: pwd, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 250))
             addConstraint(NSLayoutConstraint(item: pwd, attribute: .height  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 30))
            //button
            addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .left, relatedBy: .equal, toItem: pwd, attribute: .left, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: registerBtn , attribute: .top, relatedBy: .equal, toItem: pwd, attribute: .bottom, multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
            
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .right, relatedBy: .equal, toItem: pwd
                , attribute: .right, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: loginBtn , attribute: .top, relatedBy: .equal, toItem: pwd, attribute: .bottom, multiplier: 1.0, constant: margin))
            addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width  , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute ,multiplier: 1.0, constant: 100))
            
            
            
        }
        
        
    }
}
