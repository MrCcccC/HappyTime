//
//  HappyViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class HappyViewController: BaseViewController {
    var tableView:UITableView?
    var listarray = [Happytable]()
    var refreshControl:UIRefreshControl?
    var i :Int = 1
    ///上拉刷新
    var isPullup = false
    var MoroView : MoreView!
    var vc = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if userLogon == false{
            setupVisitorView()
        }else{
        setupUI()
        setupTableView()
        loadDatadown()
        }
    }
    
    
    //加载数据
  func loadDatadown(){
        let appkey = "4193715d6abaf71ba58a594c1e30c573"
        let a = 20
        let dict:[String:AnyObject] = ["page":i as AnyObject,"pagesize":a as AnyObject,"key":appkey as AnyObject]
        
        
               WebNetworkManager.shared.request(requestType: .GET, url: "http://japi.juhe.cn/joke/content/text.from", parameters:dict) { (responseObj, error) in
            //print(responseObj)
           guard let result = responseObj?["result"] else{
               return
            }
           
            let data = result["data"] as! NSArray
            for (_,item) in data.enumerated(){
                let list = Happytable(dict: item as AnyObject)
                self.listarray.append(list)
            }
                 self.tableView?.reloadData()
            
        }
        self.refreshControl?.endRefreshing()
        self.isPullup = false
        
        
    }
    //下载数据
    func loadDataup(){
    
            listarray.removeAll()
        
            i = 1
        let appkey = "4193715d6abaf71ba58a594c1e30c573"
        let a = 20
        let dict:[String:AnyObject] = ["page":i as AnyObject,"pagesize":a as AnyObject,"key":appkey as AnyObject]
        
        
        WebNetworkManager.shared.request(requestType: .GET, url: "http://japi.juhe.cn/joke/content/text.from", parameters:dict) { (responseObj, error) in
            
            guard let result = responseObj?["result"] else{
                return
            }
            
            let data = result["data"] as! NSArray
            for (_,item) in data.enumerated(){
                let list = Happytable(dict: item as AnyObject)
                self.listarray.append(list)
            }
            self.tableView?.reloadData()
            
        }
        self.refreshControl?.endRefreshing()
        self.isPullup = false
        
        
    }

    
    
}
extension HappyViewController{
    func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        //设置数据源代理。目的是为了让子类直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: (tabBarController?.tabBar.bounds.height)!, right: 0)
        //修改指示器的缩进
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        //设置刷新空间
        //实例化，并添加
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
        
        
        let cellNib = UINib(nibName: "HappyTableViewCell", bundle: nil)
        tableView?.register(cellNib, forCellReuseIdentifier: "happycell")
    }
    func load(){
        self.refreshControl?.endRefreshing()
        self.isPullup = false
    }
    
}
extension HappyViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listarray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var  cell=tableView.dequeueReusableCell(withIdentifier: "happycell") as? HappyTableViewCell
        if cell == nil {
            cell = HappyTableViewCell(style: .default, reuseIdentifier: "happycell")
        }
        cell!.news = listarray[indexPath.row ]
        cell!.backgroundColor = UIColor.lightGray
        return cell!
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //取得数据
        let status = listarray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "happycell")  as! HappyTableViewCell
        //计算出行高
        let rowHeigth = cell.heightForCell(status: status)
        return rowHeigth
    }
    
    //在显示最后一行的时候做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell的延迟动画
        cell.transform = CGAffineTransform(translationX: 0,y: 30)
        UIView.animate(withDuration: 1) {
            cell.transform = CGAffineTransform.identity
        }
        //1.判断indexpath是否是最后一行()
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        //print("section--\(section)")
        if row < 0 || section < 0 {
            return
        }
        //行数
        let count = tableView.numberOfRows(inSection: section)
        //如果是最后一行并且没有上啦刷新
        if row == (count - 1) && !isPullup {
            //print("上拉刷新")
            isPullup = true
            i += 1
            loadDatadown()
        }
    }
    
    //cell的点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = listarray[indexPath.row]
        let dict:[String:Any] = ["happy":model.content ?? "空"]
        Dict = dict
        
        setpop()
        }



}
extension HappyViewController{
    //重新tabItem
    override func setupadimitView() {
        
        }
    
    //创建弹窗视图
    func setpop(){
        //添加视图的蒙版
        vc = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        vc.backgroundColor = UIColor.black
        vc.alpha = 0.7
        view.addSubview(vc)
        MoroView = MoreView.init(frame: CGRect(x: view.bounds.width/2, y: view.bounds.height/2, width: 0, height: 0))
        MoroView.backgroundColor = UIColor.orange
        MoroView.alpha = 0
        MoroView.layer.cornerRadius = 20
        guard (MoroView) != nil else {
            return
        }
        view.addSubview(MoroView)
        //添加弹窗试图的动画
        MoreView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            self.MoroView.frame = CGRect(x: 10,y: (self.view.bounds.height-400)/2, width:self.view.bounds.width-20, height: 360)
            self.MoroView.alpha = 1
        }) { (_) in
            
        }
    }
    //重写屏幕与点击时间
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if MoroView != nil {
            vc.removeFromSuperview()
            MoroView.removeFromSuperview()
        }else{
            return
        }
    }

    
   }
