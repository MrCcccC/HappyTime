//
//  BaseViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //访客视图信息字典
    var visitorInfo:[String:String]?
    ///自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    ///自定义的导航条目- 以后设置的导航栏内容，统一使用navItem
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        if userLogon == nil  {
            userLogon = false
        }
        NotificationCenter.default.addObserver(self, selector: #selector(LoginSuccess), name: NSNotification.Name(rawValue: isSuccess), object: nil)
        

      setupUI()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //重写title的didSet

    override var title: String? {
        didSet{
            navItem.title = title
        }
    }
    
   
}
//设置界面
extension BaseViewController{
 
    //登录成功处理
    func LoginSuccess(n:Notification){
        print("登录成功")
        //清除登录成功后的登录
        navItem.leftBarButtonItem = nil
        navItem.rightBarButtonItem = nil
        
        
        //更新UI
        //需要重新设置view
        //在访问view 的getter 是 如果view  == nil  会调用viewdidload
        view = nil
        //注销通知,避免通知被重复注册
        NotificationCenter.default.removeObserver(self)
        
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.white
        //取消自动缩进 - 如果因曾了导航栏，会缩紧20
        automaticallyAdjustsScrollViewInsets = false
        setuNavigationBar()
        if userLogon == true {
            setupadimitView()
        }else if userLogon == false{
            setupVisitorView()  
        }
        
    }
    
    
    
    func setView(){
        view.backgroundColor = UIColor.white
        //取消自动缩进 - 如果因曾了导航栏，会缩紧20
        automaticallyAdjustsScrollViewInsets = false
        setuNavigationBar()
        
    }
    
    
    //设置访客视图
    func setupVisitorView(){
        
        let visitorView = VisitorView.init(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        //设置方可视图信息
        visitorView.visitorInfo = visitorInfo
        visitorView.loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerBtn.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        //设置导航条按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action:#selector(register) )
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action:#selector(login) )
        
    }
    
    func setupadimitView(){
        navItem.rightBarButtonItem = UIBarButtonItem(title: "地图", style: .plain, target: self, action:#selector(setMap) )
    }
    
    func login(){
        
        let nav = UINavigationController(rootViewController: LoginViewController())
        present(nav, animated: true, completion: nil)
        
        
        
    }
    func register(){
        
        let nav = UINavigationController(rootViewController: SetupViewController())
        present(nav, animated: true, completion: nil)

        
        
    }
    
    
    func setMap(){
        
        let Map = GDViewController()
        navigationController?.pushViewController(Map, animated: true)
        
        
        
        
    }
    func setuNavigationBar(){
        //添加导航条
        view.addSubview(navigationBar)
        //将item 设置给bar
        navigationBar.items = [navItem]
        
        //设置 navbar 整个背景的的渲染颜色
        navigationBar.barTintColor = UIColor.init(hexNumber: 0xF6F6F6)
        //设置navbar 的字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        //设置左右两边按钮的颜色
        navigationBar.tintColor = UIColor.orange
    }
    
}


