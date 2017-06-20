//
//  RobotViewController.swift
//  休闲时光
//
//  Created by 5201-mac on 2017/4/24.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class RobotViewController: BaseViewController {
     var messageFrames = [MessageFrame]()
      var tableView:UITableView?

  
    @IBOutlet weak var board: UIImageView!

    
    @IBOutlet weak var textfiled: UITextField!
    @IBAction func send(_ sender: Any) {
    
        var date2 = NSDate()
        var formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy-MM-dd"
        var dateString2 = formatter2.string(from: date2 as Date)
        let message = Message(dict: ["time" : dateString2 as NSObject,"text": (textfiled.text as NSObject? ?? "" as NSObject),"type" : 1 as NSObject])
        let messageFrame = MessageFrame()
        messageFrame.message = message
        // 2.添加到数据源数组中
        self.messageFrames.append(messageFrame)
        // 3.刷新列表
        self.tableView?.reloadData()
        //5. 自动滚动到最后一行
        let indexPath = IndexPath(row: self.messageFrames.count - 1, section: 0)
        self.tableView?.scrollToRow(at: indexPath, at: .bottom, animated: true)
        //6.将文字置为nil
        
        let appkey = "b2ce62d2c7c0a00a2b6cf012e53d7dc0"
        let dict:[String:AnyObject] = ["key":appkey as AnyObject,"info":textfiled.text as AnyObject]
        WebNetworkManager.shared.request(requestType: .GET, url: "http://op.juhe.cn/robot/index", parameters:dict) { (responseObj, error) in
            print(responseObj)
            guard let Data = responseObj else{
                return
            }
            var date1 = NSDate()
            var formatter1 = DateFormatter()
            formatter1.dateFormat = "yyyy-MM-dd"
            var dateString1 = formatter1.string(from: date1 as Date)
            let data = Data["result"]
            var text = data?["text"]
            if text == nil {
                text = "由于我的功能不完全，听不懂你在说什么！"
            }
            let message = Message(dict: ["time" : dateString2 as NSObject,"text":text as! NSObject,"type" : 0 as NSObject])
            self.textfiled.text = nil
            let messageFrame = MessageFrame()
            messageFrame.message = message
            // 2.添加到数据源数组中
            self.messageFrames.append(messageFrame)
            
            // 3.刷新列表
            self.tableView?.reloadData()
            
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title="问答机器人"
        // Do any additional setup after loading the view.
        settable()
        textfiled.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func settable(){
        tableView = UITableView(frame: view.frame, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        //设置数据源代理。目的是为了让子类直接实现数据源方法
        tableView?.backgroundColor = UIColor.lightGray
        tableView?.dataSource = self
        tableView?.delegate = self
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom:board.bounds.height, right: 0)
        //修改指示器的缩进
        tableView?.scrollIndicatorInsets = tableView!.contentInset

    }

}
extension RobotViewController:UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
    override func setupadimitView() {
        
    }

    //MARK: 数据源方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageFrames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "MessageCell"
        
        //根据标示符在缓存池中查找cell对象
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? MessageCell
        if cell == nil {
            //根据重用表示符创建cell对象
            cell = MessageCell(style: .default, reuseIdentifier: cellId)
        }
        cell?.backgroundColor=UIColor.lightGray
        cell?.messageFrame = self.messageFrames[indexPath.row]
        
        //返回cell对象
        return cell!
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.messageFrames[indexPath.row].rowHeight
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  }
