//
//  SetupViewController.swift
//  休闲时光5201
//  Created by 5201-mac on 2017/5/5.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import AVOSCloud

class SetupViewController: UIViewController {
    var registerView : RegisterView!
    var url:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontsize: 16, target: self, action: #selector(close), isBackButton: true)
        setupUI()
        title = "注册"
        view.backgroundColor = UIColor.white
        let file = AVFile(url:"http://ac-PpyA6JY8.clouddn.com/54796e7df4a519558aa6.jpg")
        file.getData()
        file.saveInBackground({ (result, e) in
            if e != nil{
                print(e!)
            }else{
                self.url = file.url
            }
        })
    }
    
    
    
    
}

extension SetupViewController{
    //点击事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //返回事件
    func close(){
        dismiss(animated: true, completion: nil)
    }
    //创建控件
    func setupUI(){
        view.backgroundColor = UIColor(hexNumber: 0xEDEDED)
        registerView = RegisterView.init(frame: CGRect(x: 0, y: 0, width:view.bounds.width, height: view.bounds.height-64))
        guard let register = registerView else {
            return
        }
        view.addSubview(register)
        register.loginBtn.addTarget(self, action: #selector(registerBtn), for: .touchUpInside)
    }
    
    
    //注册的事件
    func registerBtn(){
        if registerView.pwd.text != registerView.pwd2.text {
            let alert = UIAlertView(title: "错误", message: "两次密码不一致", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }else if registerView.username.text == "" || registerView.pwd.text == "" || registerView.pwd2.text == ""{
            let alert = UIAlertView(title: "错误", message: "用户名密码不能为空", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
        else {
            guard let str = registerView.username.text else {
                return
            }
            guard let str2 = registerView.pwd.text else {
                return
            }
            let query = AVQuery(className: "Code")
            query.whereKey("Name", equalTo: str)
            query.getFirstObjectInBackground { (result, er) in
                if er != nil{
                    let query = AVObject(className: "Code")
                    query.setObject(self.url, forKey: "Image")
                    query.setObject(str, forKey: "Name")
                    query.setObject(str2, forKey: "Pass")
                    query.setObject("无", forKey: "Nicheng")
                    query.setObject("无", forKey: "Gexing")
                    query.saveInBackground({ (result, e) in
                        if e != nil{
                            print(e!)
                        }else{
                            let alert = UIAlertView(title: "正确", message: "注册成功", delegate: nil, cancelButtonTitle: "确定")
                            alert.show()
                            self.dismiss(animated: true, completion: nil)
                        }
                    })
                }else{
                    let alert = UIAlertView(title: "错误", message: "用户名存在", delegate: nil, cancelButtonTitle: "确定")
                    alert.show()
                }
                
            }
            
        }
        
    }
    
    
    
}
