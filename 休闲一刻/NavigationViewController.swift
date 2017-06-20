//
//  NavigationViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //隐藏默认的NavigationBar
        navigationBar.isHidden = true
    }

    ///重写push方法
    
    ///设置他左侧的按钮作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //隐藏底部的tabar
        if childViewControllers.count>0{
            
            viewController.hidesBottomBarWhenPushed = true
            
            //判断控制器的类型
            var  title = "返回"
            
            //判断控制器的所在层数
            if childViewControllers.count == 1{
                title = childViewControllers.first?.title ?? "返回"
            }
            
            if let vc = viewController as? BaseViewController  {
                //取出自定义的navitem
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, fontsize: 16, target: self, action:#selector(back) ,isBackButton:true )
            }
            
            
        }
        super.pushViewController(viewController, animated: true)
    }
    
    //返回到上一级控制器
    func back(){
        popViewController(animated: true)
    }
}
