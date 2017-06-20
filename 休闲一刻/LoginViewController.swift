//
//  LoginViewController.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/29.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import AVOSCloud


class LoginViewController: UIViewController {
    var username : String?
    var pwd : String?
    var loginview : LoginView?
    var truepwd : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        title = "登录"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontsize: 16, target: self, action: #selector(close), isBackButton: true)
        setupUI()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func close(){
        dismiss(animated: true, completion: nil)
    }
    
    //创建视图
     func setupUI() {
        view.backgroundColor = UIColor(hexNumber: 0xEDEDED)
        //创建登录的按钮等
    loginview = LoginView.init(frame: CGRect(x: 0, y: 0, width:view.bounds.width, height: view.bounds.height-64))
    guard let loginView = loginview else {
        return
    }
        view.addSubview(loginView)
        loginView.loginBtn.addTarget(self, action:#selector(check), for: .touchUpInside)
    
    }
    
    //判断用户名密码是否正确
    func  check(){
        username = loginview?.username.text
        pwd = loginview?.pwd.text
        if username == "" || pwd == ""  {
            let alertController = UIAlertController(title: "通知", message: "不能输入空的用户名或密码", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
            
            let okAction = UIAlertAction(title: "确定", style: .default, handler:{
                (UIAlertAction) -> Void in
                print("点击确定事件")
            })
            alertController.addAction(okAction)// 当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
            self.present(alertController, animated: true, completion: nil)
        }else{
           getPass(code: username!)
            user = username!
        }
    }
    
    //查询的代码
    func getPass(code:String) {
        
        let query = AVQuery(className: "Code")
        query.whereKey("Name", equalTo: code)
        query.getFirstObjectInBackground { (code, e) in
            if e != nil{
                print("出错",e?.localizedDescription as Any)
            }
            if let code = code,
               let pass = code["Pass"] as? String,
                let nicheng = code["Nicheng"] as? String,
                let gexing = code["Gexing"] as? String,
                let url = code["Image"] as? String,
                let userid = code["objectId"] as? String{
                if self.pwd == pass{
                    Nicheng = nicheng
                    Gexing = gexing
                    userID = userid
                    ImgURL = url
                    userLogon = true
                    //通过通知，发送登陆成功消息,只发送通知
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: isSuccess), object: nil )
                    //关闭窗口
                    self.close()
                }else{
                    let alert = UIAlertView(title: "错误", message: "密码错误", delegate: nil, cancelButtonTitle: "确定")
                    alert.show()
                }
            }
        }

 }
    
    
}
