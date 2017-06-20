//
//  MainViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return  .portrait
    }

   
      lazy var composeButton = UIButton.init(BtnImage: "add", backgroundImage: "",highLighted:"add_highlighted")
    
    func Sratus(){
        //测试方向旋转
        //        let vc = UIViewController()
        //        let nav = UINavigationController(rootViewController: vc)
        //        present(nav, animated: true, completion: nil)
        
    }

}
//extention 类似于oc中的分类。在swift 中还可以用来分割代码块
//可以吧相近功能的函数，放在一个extention中，便于代码的维护
//注意：oc 的分类一样，extention中不能定义属性
//MARK - 设置界面
extension  MainViewController{
       //设置所有自控制器
    func setupChildControllers(){
        //在现在的很多应用程序中，界面的创建都需要依赖网络的json
        let array:[[String:Any]] = [
            ["clsName":"HomeViewController","title":"首页","ImageName":"Home","visitorInfo":["imageName":"","message":"让我们瞧瞧这里都有些什么有趣的东西"]
            ],
            ["clsName":"HappyViewController","title":"笑话","ImageName":"Descover","visitorInfo":["imageName":"descover","message":"登录后，可以看最新的笑话，其乐无穷"]
            ],
            ["clsName":"HealthViewController","title":"新闻","ImageName":"Message","visitorInfo":["imageName":"message","message":"登录后，你可以看到想、最新最热的头条新闻"]
            ],
            ["clsName":"MineViewController","title":"我的","ImageName":"Mine","visitorInfo":["imageName":"mine","message":"登陆后，你的资料都会显示在这里"]
            ],
            ]
        //测试数据格式是否正确 - 转换成plist数据更加直观
        //(array as NSArray).write(toFile: "/users/a5201/demo.plist", atomically: true)
        var arrayM = [UIViewController]()
        for dict in array{
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    //使用字典创建一个子控制器
    
    ///-parameter dict ：信息字典
    
    ///- return ;子控制器
    func controller(dict:[String:Any])->UIViewController{
        
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["ImageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? BaseViewController.Type,
            let visitorDict = dict["visitorInfo"] as? [String:String]
            else{
                return UIViewController()
        }
        
        //创建试图控制器
        
        let  vc = cls.init()
        
        vc.title = title
        
        //设置控制器的访客信息字典
        vc.visitorInfo = visitorDict
        //设置图像
        vc.tabBarItem.image = UIImage(named:"tabbar_" + imageName )
        //高亮的图像
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal )
        
        //设置tabbar的字体的颜色(大小)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.red], for: .highlighted)
        //系统默认是12号字，修改字体大小要设置normal的字体大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 11)], for: .normal)
        //实例化导航控制器的时候，会调用 push 方法，压zhan
        let nav = NavigationViewController(rootViewController: vc)
        
        return nav
    }
}
