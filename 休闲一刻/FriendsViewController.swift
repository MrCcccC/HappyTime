//
//  FriendsViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/19.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController {

    var tableView = UITableView()
     var refreshControl:UIRefreshControl?
    var array:Array<String>?
    var i = 10
    ///上拉刷新
    var isPullup = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "好友列表"
        setUpTable()
    }

   }
extension FriendsViewController{
    override func setupadimitView() {
        
    }
    
    
    func setUpTable(){
        loadDatadown()
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView, belowSubview: navigationBar)
        //设置数据源代理。目的是为了让子类直接实现数据源方法
        tableView.dataSource = self
        tableView.delegate = self
        //设置内容缩进
        tableView.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: (tabBarController?.tabBar.bounds.height)!, right: 0)
        //修改指示器的缩进
        tableView.scrollIndicatorInsets = tableView.contentInset
        //设置刷新空间
        //实例化，并添加
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl!)
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadDatadown), for: .valueChanged)
    }
    
    //好友数据加载
    func loadDatadown(){
         array = []
        for num in 1...i{
            let friends = "好友--\(num)"
            array?.append(friends)
        }
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        self.isPullup = false
        
    }

}
extension FriendsViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array!.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var  cell=tableView.dequeueReusableCell(withIdentifier: "friends")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "friends")
        }
        cell?.textLabel?.text = array![indexPath.row]
        return cell!
    }

    //在显示最后一行的时候做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
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
            i += 5
            loadDatadown()
        }
    }

    
}
