//
//  HomeViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //创建以个UIscrollview
    var scroll : UIScrollView!
    //创建以个数组,存放图片
    var array = ["happy1","happy2","happy3","happy4"]
    var pagenow = 0
    var page = UIPageControl()
     var timer : Timer! //定时器
    let Namearray:Array<String> = ["巨蟹座","摩羯座","水瓶座","白羊座","天蝎座","天秤座","双鱼座","双子座","射手座","金牛座","狮子座","处女座"]
    var  Namelabel = UILabel()
    var  Timelabel = UILabel()
    var  Constellation = UIScrollView()
    let timeArray:Array<String>=["today","tomorrow","week","nextweek","month"]
    var ScrollerView = UIScrollView()
    var type : String!
    var homeView : HomeView?
    var aview : UIScrollView!
    var ImageNameLabel = UILabel()//deslabel
    var Image=UIImageView()//图片
    var Imagenum = 0
    var pagenum = 1
    var dataArray = Array<AnyObject>()
    
    
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        if userLogon == false{
         setupVisitorView()
        }else{
        setScroll()
        addTimer()
          
//            if Imagenum == 0 {
//                leftBtn.isEnabled = true
//            }else{
//                leftBtn.isEnabled = false
//            }

        }
        // Do any additional setup after loading the view.
        
        GameBtn.addTarget(self, action: #selector(go), for: .touchUpInside)
    }

    func go(){
        let robot = RobotViewController()
        navigationController?.pushViewController(robot, animated: true)
    }

}


extension HomeViewController:UIScrollViewDelegate{
    //创建视图
    func setScroll(){
        
        scroll = UIScrollView(frame: view.bounds)
        scroll.backgroundColor = UIColor.lightGray
        view.insertSubview(scroll, belowSubview: navigationBar)
        scroll.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: (tabBarController?.tabBar.bounds.height)!, right: 0)
        scroll.scrollIndicatorInsets = scroll.contentInset
        //scroll.showsVerticalScrollIndicator = false
        scroll.contentSize = CGSize(width: 0, height: view.bounds.height*1.5)
        ScrollUpView()
        setConstellationScroll()
    }
    //创建Scroll上的视图
    func ScrollUpView()
    {
         ScrollerView.frame =  CGRect(x: 10, y: 10, width: scroll.bounds.width-20, height: 180)
        scroll.addSubview(ScrollerView)
        ScrollerView.backgroundColor = UIColor.white
        ScrollerView.showsHorizontalScrollIndicator = false
        ScrollerView.delegate = self
        ScrollerView.contentSize = CGSize(width: ScrollerView.bounds.width*CGFloat(array.count), height: 0)
        let iamg = UIImageView(frame: CGRect(x: -2, y: 0, width: scroll.bounds.width, height: 201))
        iamg.image = UIImage(named: "ddd")
        scroll.addSubview(iamg)
        for i in 0..<array.count{
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*ScrollerView.bounds.width, y: 0, width: ScrollerView.bounds.width, height: 179))
            imageView.image = UIImage(named:array[i] )
            ScrollerView.addSubview(imageView)
        }
        page.frame = CGRect(x: view.bounds.width/2-30, y:ScrollerView.bounds.height-25 , width: 60, height: 30)
       scroll.addSubview(page)
        page.numberOfPages = array.count
        page.isEnabled = true
        page.pageIndicatorTintColor = UIColor.blue
        page.currentPageIndicatorTintColor = UIColor.red
        
        //创建一个HOmeview
        homeView = HomeView.init(frame: CGRect(x: 10, y: ScrollerView.bounds.height , width:view.bounds.width-20, height: 400))
        let bgm = UIImageView(frame:CGRect(x: 10, y: ScrollerView.bounds.height+240 , width:view.bounds.width-10, height: 150))
        bgm.image = UIImage(named: "aaa")
        scroll.addSubview(bgm)
        guard let homeview = homeView else {
            return
        }
        scroll.addSubview(homeview)

        
    
    }
    
    //下一张图片
    func nextPage(){
        let count = array.count
        
        if page.currentPage == count - 1 {
            pagenow = 0
        }else{
            pagenow = page.currentPage + 1
        }
        //计算轮播器滚动的位置
      let offsetX = CGFloat(pagenow) * ScrollerView.bounds.width
      let offset = CGPoint(x: offsetX, y: 0)
        ScrollerView.setContentOffset(offset, animated: true)
    }
    
    //添加定时器
    func addTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0,
                                     target: self,
                                     selector: #selector(nextPage),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }
    //移除定时器
    func removeTimer(){
     timer.invalidate()
        
    }
    
    
  //ScrollerView的代理方法
    //轮播器滚动时调用的方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let ScrollW = ScrollerView.bounds.width
        let pageN = (ScrollerView.contentOffset.x + ScrollW*0.5)/ScrollW
         page.currentPage = Int(pageN)
    }
    
    
    //轮播器拖拽时调用的方法
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        removeTimer()
    }
    //停止拖拽的时候调用该方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addTimer()
    }
  
}

extension HomeViewController{
    //添加星座查询
    func setConstellationScroll(){
        Constellation.frame = CGRect(x: 5, y: ScrollerView.bounds.height+CGFloat(420), width: self.view.bounds.width-10, height: 370)
        Constellation.backgroundColor=UIColor.lightGray
        scroll.addSubview(Constellation)
        let bgm = UIImageView(frame: CGRect(x: 5, y: ScrollerView.bounds.height+CGFloat(624), width: self.view.bounds.width-15, height: 160))
        bgm.image = UIImage(named: "bbb")
        scroll.addSubview(bgm)
        let iamg = UIImageView(frame: CGRect(x: 6, y: ScrollerView.bounds.height+CGFloat(425), width: self.view.bounds.width-15, height: 140))
        iamg.image = UIImage(named: "ccc")
        scroll.addSubview(iamg)


        Namelabel.frame = CGRect(x: 15, y: 15, width: Constellation.bounds.width/3, height: 35)
        Namelabel.text = "星座类型"
        Namelabel.backgroundColor = UIColor.brown
        Namelabel.textColor = UIColor.white
        Namelabel.textAlignment = .center
        Namelabel.font = UIFont.systemFont(ofSize: 13)
        Constellation.addSubview(Namelabel)
        
        let namebutton = UIButton(frame: Namelabel.frame)
        namebutton.alpha = 1
        namebutton.addTarget(self, action: #selector(ChooseName), for: .touchUpInside)
        Constellation.addSubview(namebutton)
        
        
        
        Timelabel.frame = CGRect(x:Namelabel.frame.maxX+CGFloat(10), y:15, width: Constellation.bounds.width/3, height: 35)
        Timelabel.text = "时间类型"
        Timelabel.backgroundColor = UIColor.brown
        Timelabel.textColor = UIColor.white
        Timelabel.textAlignment = .center
        Timelabel.font = UIFont.systemFont(ofSize: 13)
        Constellation.addSubview(Timelabel)
        
        let timebutton = UIButton(frame: Timelabel.frame)
        timebutton.alpha = 1
        timebutton.addTarget(self, action: #selector(Choosetime), for: .touchUpInside)
        Constellation.addSubview(timebutton)
        
        let search = UIButton(title: "搜索", fontSize: 13, normalColor: UIColor.white, highlightedColor: UIColor.orange)
        search.frame = CGRect(x:Timelabel.frame.maxX+CGFloat(10) , y: 15, width:Constellation.bounds.width/5, height: 35)
        search.backgroundColor = UIColor.brown
        search.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        Constellation.addSubview(search)
        
        aview = UIScrollView(frame: CGRect(x: 15, y: self.Namelabel.frame.maxY+CGFloat(10), width:self.Constellation.bounds.width-30 , height: 295))
        let img = UIImageView(frame: aview.frame)
        img.image = UIImage(named: "space")
        img.alpha = 0.5
        Constellation.insertSubview(img, at: 0)
        Constellation.addSubview(aview)
        
       
    }
    
    
    func ChooseName(){
        
        let alert = UIAlertController(title: "星座类型", message: "请选择星座类型", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
            for i in 0..<Namearray.count{
            let button = UIAlertAction(title:Namearray[i], style: .default, handler:{
                (UIAlertAction) -> Void in
                self.Namelabel.text = self.Namearray[i]
                
            })
            alert.addAction(button)
           
        }
        let quit = UIAlertAction(title: "取消", style: .cancel, handler:{
            (UIAlertAction) -> Void in
            
        })
        alert.addAction(quit)
        self.present(alert, animated: true, completion: nil)
        }

    
    //时间选择
    func Choosetime(){
        
        
        let alert = UIAlertController(title: "时间类型", message: "请选择时间类型", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
        for i in 0..<timeArray.count{
            switch self.timeArray[i]{
            case "today":
                type = "今天"
            case "tomorrow":
                type = "明天"
            case "week":
                type = "今周"
            case "nextweek":
                type = "下周"
            
            default:
                type = "今月"
                
            }
            let button = UIAlertAction(title:type, style: .default, handler:{
                (UIAlertAction) -> Void in
            self.Timelabel.text=self.timeArray[i]
                switch self.timeArray[i]{
                case "today":
                    self.Timelabel.text = "今天"
                case "tomorrow":
                   self.Timelabel.text = "明天"
                case "week":
                    self.Timelabel.text = "今周"
                case "nextweek":
                    self.Timelabel.text = "下周"
               
                default:
                   self.Timelabel.text = "今月"
                    
                }
                
            })
            alert.addAction(button)
            
        }
        let quit = UIAlertAction(title: "取消", style: .cancel, handler:{
            (UIAlertAction) -> Void in
            
        })
        alert.addAction(quit)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //数据下载
    func loadData(){
        for i in aview.subviews{
            i.removeFromSuperview()
        }
       
    let ConstellationName = Namelabel.text
    var  ConstellationTime:String!
        switch Timelabel.text!{
        case "今天":
            ConstellationTime = "today"
        case "明天":
            ConstellationTime = "tomorrow"
        case "今周":
            ConstellationTime = "week"
        case "下周":
            ConstellationTime = "nextweek"
        default:
            ConstellationTime = "month"
        
            
        }


        if ConstellationName == "星座类型" || ConstellationTime == "时间类型" {
            let alert = UIAlertView(title: "错误", message: "选择类型错误", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }else{
            let appkey = "c70862a73c80e155df5801a7b9a292d2"
            let dict:[String:AnyObject] = ["key":appkey as AnyObject,"type":ConstellationTime as AnyObject,"consName":ConstellationName as AnyObject  ]
            WebNetworkManager.shared.request(requestType: .GET, url: "http://web.juhe.cn:8080/constellation/getAll", parameters:dict) { (responseObj, error) in
                guard let data = responseObj else{
                    return
                }
                var array = Array<String>()
                let name = "民称:\(data["name"]!)"
                let health = "健康:\(data["health"]!)"
                let work = "工作:\(data["work"]!)"
                let money = "财运:\(data["money"]!)"
                let love = "恋爱:\(data["love"]!)"
                let date = data["date"]
                let Date = "日期:\(date!)"
                array.append(name )
                array.append(health )
                array.append(work )
                array.append(money )
                array.append(love )
                array.append(Date)
                var barray = Array<CGFloat>()
                for i in 0..<array.count{
                    var label = UILabel()
                    if i == 0{
                        label = UILabel(frame: CGRect(x: 5, y: 5, width: self.aview.bounds.width-10, height: 35))

                    }else{
                    label = UILabel(frame: CGRect(x: 5, y: CGFloat(5)+barray[i-1], width: self.aview.bounds.width-10, height: 35))
                    }
                    label.text = array[i]
                    label.textColor = UIColor.white
                    label.numberOfLines = 0
                    label.sizeToFit()
                    label.font = UIFont.systemFont(ofSize: 16)
                    barray.append(label.frame.maxY)
                    self.aview.addSubview(label)
                    
                }
                self.aview.contentSize = CGSize(width: 0, height: barray[barray.count-1])
                
                    }
       
        }
        
        
        
        
    }
    
   

}


    

