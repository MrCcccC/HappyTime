//
//  HealthViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit


class HealthViewController: BaseViewController {
    var tableView:UITableView?
    var listarray = [tableViewItem]()
    var refreshControl:UIRefreshControl?
    ///上拉刷新
    var isPullup = false
    var MoroView : HappyType!
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
        print(listarray.count)
        let appkey = "50f6448ef3b9ad142cb8060c9798643a"
        let dict:[String:AnyObject] = ["key":appkey as AnyObject,"type":type as AnyObject ]
        WebNetworkManager.shared.request(requestType: .GET, url: "http://v.juhe.cn/toutiao/index", parameters:dict) { (responseObj, error) in
            self.listarray = []
            guard let result = responseObj?["result"] else{
                return
            }
            let data = result["data"] as! NSArray
            for (_,item) in data.enumerated(){
                let list = tableViewItem(dict: item as AnyObject)
                self.listarray.append(list)
            }
            self.tableView?.reloadData()
        }
        
        self.refreshControl?.endRefreshing()
        self.isPullup = false

    }
    
    
}
extension HealthViewController{
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
        refreshControl?.addTarget(self, action: #selector(loadDatadown), for: .valueChanged)
        
        
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView?.register(cellNib, forCellReuseIdentifier: cellId)
    }
    

}
extension HealthViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return listarray.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var  cell=tableView.dequeueReusableCell(withIdentifier: cellId) as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell(style: .default, reuseIdentifier: cellId)
        }
        cell!.news = listarray[indexPath.row ]
       // cell!.backgroundColor = UIColor.lightGray
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:tableViewItem = listarray[indexPath.row]
        let url = URL(string: model.URL!)
        UIApplication.shared.openURL(url!)
    }
    
}
extension HealthViewController{
        //重新tabItem
        override func setupadimitView() {
            navItem.rightBarButtonItem = UIBarButtonItem(title: "种类", style: .plain, target: self, action:#selector(choose) )
        }
        func choose()
        {
            //添加视图的蒙版
            vc = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            vc.backgroundColor = UIColor.black
            vc.alpha = 0.7
            view.addSubview(vc)
                 MoroView = HappyType(frame:CGRect(x: self.view.bounds.width, y: 62, width: 130, height: self.view.bounds.height-124))
                MoroView.backgroundColor = UIColor.lightGray
                MoroView.alpha = 0.2
                self.view.addSubview(MoroView)
                HappyType.animate(withDuration: 1, delay: 0.5, options: .curveLinear, animations: {
                    self.MoroView.frame =  CGRect(x:self.view.bounds.width-130, y: 64, width:130, height: self.view.bounds.height-110)
                    self.MoroView.alpha = 1
                }) { (_) in
                    
                }
            
        }

    //重写屏幕与点击时间
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if MoroView != nil {
            vc.removeFromSuperview()
            MoroView.removeFromSuperview()
            loadDatadown()
        }else{
            return
        }

            }

}
