//
//  MineViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/11.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import AVOSCloud

let cellId = "cellId"
class MineViewController: BaseViewController {
    //表格视图。如果用户没有登录，就没有
    var tableView:UITableView?
    //定义一个图片选择器的属性
    var imagePickerController:UIImagePickerController=UIImagePickerController()
    var uploadAlertController:UIAlertController!
    var headimg : UIImageView?
    var detailLabel = UILabel()
    var MineLabel = UILabel()
    var StringM : String!
    var imageView = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if userLogon == false{
            setupVisitorView()
        }else{
        self.initAlertController()
        self.initImagePickerController()
         setupUI()
            setupTableView()
          }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    
}

extension MineViewController{
    override func setupadimitView() {
        
    }
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
        
    }

}
//实现tableView的代理
extension MineViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1{
            return 2
        }else if section == 2{
            return  4
        }else{
            return 1
        }
    }
 
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0{
            if indexPath.row == 0{
                cell.textLabel?.text = "昵称"
                 detailLabel = UILabel(frame: CGRect(x: cell.bounds.width-90, y:5, width: 80, height: cell.bounds.height-10))
                if detailLabel.text == nil {
                    detailLabel.text = Nicheng
                }
                detailLabel.textColor = UIColor.red
                detailLabel.textAlignment = .right
                cell.addSubview(detailLabel)
            }else if indexPath.row == 1{
                cell.textLabel?.text = "头像"
                 headimg = UIImageView(frame: CGRect(x: cell.bounds.width-40, y:5, width:cell.bounds.height-10 , height: cell.bounds.height-10))
                if headimg?.image == nil{
                    DispatchQueue.global().async {
                        let url = NSURL(string: ImgURL)
                        let  model = UIImageView()
                        model.sd_setImage(with: url as URL?)
                        DispatchQueue.main.async {
                            self.headimg?.image = model.image
                        }
                    }                }
                cell.addSubview(headimg!)
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0{
                cell.textLabel?.text = "个性签名"
                MineLabel = UILabel(frame: CGRect(x: cell.bounds.width-200, y:5, width: 190, height: cell.bounds.height-10))
                if MineLabel.text == nil {
                   MineLabel.text = Gexing
                   
                }
                MineLabel.lineBreakMode = .byTruncatingMiddle
                StringM = MineLabel.text
                MineLabel.textColor = UIColor.red
                MineLabel.textAlignment = .right
                cell.addSubview(MineLabel)
            }else if indexPath.row == 1{
                cell.textLabel?.text = "好友"
            }
            
        }else if indexPath.section == 2{
            if indexPath.row == 0{
                cell.textLabel?.text = "收藏"
            }else if indexPath.row == 1{
                cell.textLabel?.text = "发布"
            }else if indexPath.row == 2{
                cell.textLabel?.text = "客服"
            }else{
                cell.textLabel?.text = "关于"
            }
            
        }else if indexPath.section == 3{
            if indexPath.row == 0{
                let quit = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: cell.bounds.height))
                quit.backgroundColor = UIColor.red
                quit.setTitle("退出登录", for: .normal)
                quit.setTitleColor(UIColor.white, for: .normal)
                quit.addTarget(self, action: #selector(userquit), for: .touchUpInside)
                cell.addSubview(quit)
            }
        }
        
        return cell
    }
       //cell的点击监听事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 0{
                alert(placeholder: "请输入您要修改的昵称", Title: "修改昵称", label: detailLabel, String: "", type: "Nicheng")
            }
            else if indexPath.row == 1 {
                  present(self.uploadAlertController, animated:true, completion: nil)
                }
        }
        else if indexPath.section == 1{
            if indexPath.row == 0 {
              alert(placeholder: "请输入您要修改的个性签名", Title: "修改个性签名", label: MineLabel, String: StringM, type: "Gexing")
            }else if indexPath.row == 1{
                //点击后界面的跳转
                let frineds = FriendsViewController()
                navigationController?.pushViewController(frineds, animated: true)
            }
        }else if indexPath.section == 2{
            if indexPath.row == 2{
                let alert = UIAlertView(title: "请拨打客服电话", message: "0517-5123650", delegate: nil, cancelButtonTitle: "确定")
                alert.show()
                
            }else if indexPath.row == 3 {
                let about = AboutViewController()
                navigationController?.pushViewController(about, animated: true)

            }
        }
    }
    func userquit(){
        let alertController = UIAlertController(title: "通知", message: "确定要退出APP?", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
        
        let okAction = UIAlertAction(title: "确定", style: .default, handler:{
            (UIAlertAction) -> Void in
            userLogon = false
            exit(0)

        })
               let quitAction = UIAlertAction(title: "取消", style: .cancel, handler:{
            (UIAlertAction) -> Void in
            
        })
        alertController.addAction(okAction)// 当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
         alertController.addAction(quitAction)
        self.present(alertController, animated: true, completion: nil)

        
    }
  
}
//设置本地照片选取的代理
extension MineViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //初始化一个弹出视图
    func initAlertController()
    {
        weak var blockSelf = self
        self.uploadAlertController = UIAlertController(title:nil, message: nil, preferredStyle:UIAlertControllerStyle.actionSheet)
        self.uploadAlertController.view.tintColor = UIColor.black
      
        let photoLib = UIAlertAction(title:"从相册选择", style:UIAlertActionStyle.default) { (action:UIAlertAction)in
            blockSelf?.actionAction(action: action)
        }
        let cancel = UIAlertAction(title:"取消", style:UIAlertActionStyle.cancel) { (action:UIAlertAction)in
            blockSelf?.actionAction(action: action)
        }
        self.uploadAlertController?.addAction(photoLib)
        self.uploadAlertController?.addAction(cancel)
    }
    //添加各个按钮的监听
    func actionAction(action:UIAlertAction)
    {
        if action.title == "从相册选择" {
            self.getImageFromPhotoLib(type: .photoLibrary)
    
        }

    }
    //初始化UIPicker
      func initImagePickerController()
    {
       
        self.imagePickerController.delegate = self
        // 设置是否可以管理已经存在的图片或者视频
        self.imagePickerController.allowsEditing = true
    }
       func getImageFromPhotoLib(type:UIImagePickerControllerSourceType)
    {
        self.imagePickerController.sourceType = type
        //判断是否支持相册
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.present(self.imagePickerController, animated: true, completion:nil)
        }
    }
    
    //MARK:- UIImagePickerControllerDelegate
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [String :Any]){
        
        let type:String = (info[UIImagePickerControllerMediaType]as!String)
        //当选择的类型是图片
        if type=="public.image"
        {
            let img = info[UIImagePickerControllerOriginalImage]as?UIImage
            headImage = img
            self.headimg?.image = img
            var urlImg:String!
                let imgData = UIImageJPEGRepresentation((self.headimg!.image!),0.5)
                let file = AVFile(data: imgData!)
                file.saveInBackground({ (result, e) in
                    if e != nil{
                        print(e!)
                    }else{
                        urlImg = file.url
                        ImgURL = urlImg
                        let query = AVObject(className: "Code", objectId: userID)
                        query.setObject(urlImg, forKey: "Image")
                        query.saveInBackground({ (r, e) in
                            if e != nil{
                                print(e!)
                            }
                        })

                    }
                })
            
            picker.dismiss(animated:true, completion:nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
        picker.dismiss(animated:true, completion:nil)
    }
}

extension MineViewController{
    //弹窗的设置
    func alert(placeholder:String,Title:String,label:UILabel,String:String = "",type:String = ""){
         let alertController = UIAlertController(title: Title, message:nil, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            if String != ""{
            textField.text = String
            }
            textField.placeholder = placeholder
        }
    
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) {
            (action: UIAlertAction!) -> Void in
            guard let text = alertController.textFields?.first?.text else{
                return
            }
            label.text = text
            self.StringM = text
            self.refresh(String: text, type: type)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
       alertController.addAction(cancelAction)
     alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
    }
    
    //更新云端数据的代码
    func refresh(String:String,type:String){
        let query = AVObject(className: "Code", objectId: userID)
        query.setObject(String, forKey: type)
        query.saveInBackground()
    }

    }

