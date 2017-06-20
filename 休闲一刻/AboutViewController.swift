//
//  AboutViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/18.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {
    var Scroll = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "关于"
        setotherUI()
    }

}
extension AboutViewController{
    override func setupadimitView() {
        
    }
}


extension AboutViewController{
    //创建显示视图
    func setotherUI(){
        Scroll = UIScrollView(frame: view.bounds)
        Scroll.backgroundColor = UIColor.lightGray
        view.insertSubview(Scroll, belowSubview: navigationBar)
        Scroll.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: 0, right: 0)
        Scroll.scrollIndicatorInsets = Scroll.contentInset
        //scroll.showsVerticalScrollIndicator = false
        //Scroll.contentSize = CGSize(width: 0, height: view.bounds.height*2)
    
      let Text = UILabel(frame: CGRect(x: 5, y: 40, width: view.bounds.width-10 , height: 100))
        Text.textColor = UIColor.black
        Text.font = UIFont.systemFont(ofSize: 18)
        Text.text="浙江万里学院（Zhejiang Wanli University）位于浙江宁波，是一所经中华人民共和国教育部批准设立的省属普通高等院校、硕士学位授予单位，由浙江省万里教育集团为主举办，试行民办学校运行机制，是公办院校进行管理模式和运行机制改革的新型高校。浙江万里学院前身为创建于1950年的浙江省立宁波农业技术学校；1958年8月，建立宁波地区农业专科学校；1960年，组建宁波农学院；后历经宁波地区农业专科学校、宁波地区农林学校、宁波地区农学院、浙江农业大学宁波分校；1984年11月，改建为浙江农村技术师范专科学校；1999年8月，更名为浙江万里职业技术学院；2002年3月，升格为浙江万里学院据2017年3月学校官网信息显示，浙江万里学院共有钱湖、回龙两个校区，占地1400余亩，建筑面积65万平方米，实验设备总值2亿余元，下设10个二级学院，开设有43个本科专业，有2个工程硕士授权领域，有专任教师1000余名，全日制在校本科生、研究生、留学生等2万余名。"
        Text.numberOfLines = 0
        Text.sizeToFit()
        Scroll.addSubview(Text)
        Scroll.contentSize = CGSize(width: 0, height: Text.frame.maxY+CGFloat(10))
        
    }
    
    
    
}
