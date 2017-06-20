//
//  MessageCell.swift
//  1.黑马QQ
//
//  Created by NeXTSTEP on 16/7/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //程序员保证 在用到timeLabel的时候 这个控件一定不为nil
    var timeLabel: UILabel!
    var iconView: UIImageView!
    var textBtn: UIButton!
   
    //重写覆盖父类的构造函数
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        //设置cell的选中样式 
        self.selectionStyle = .none
    }
    
    //系统自动强制生成的代码  默认就是报错
    required init?(coder aDecoder: NSCoder) {
        //默认实现报错  如果从xib中加载该对象 默认就会报错
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置UI界面  实例化控件添加控件
    func setupUI() {
        //时间
        let timeLabel = UILabel()
        timeLabel.textAlignment = .center
        //timeLabel.backgroundColor = UIColor.brownColor()
        //设置文字颜色
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 11)
        self.timeLabel = timeLabel
        self.contentView.addSubview(timeLabel)
        //头像
        let iconView = UIImageView()
        self.iconView = iconView
        self.contentView.addSubview(iconView)
        
        //消息记录
        let textBtn = UIButton()
        //设置按钮的文字的颜色
        textBtn.setTitleColor(UIColor.darkGray, for: UIControlState())
        //设置文字的大小
        textBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //textBtn.backgroundColor = UIColor.redColor()
        //设置内容显示的内边距
        textBtn.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //设置换行
        textBtn.titleLabel?.numberOfLines = 0
        self.textBtn = textBtn
        self.contentView.addSubview(textBtn)
        
    }
    
    
    //frame模型
    var messageFrame: MessageFrame? {
        didSet {
            //设置数据
            timeLabel.text = messageFrame?.message?.time
            //消息类型
            let type = messageFrame?.message?.type ?? 0
            let imageName = type == 0 ? "Other" : "me"
            if imageName == "me" {
                if headImage != nil {
                iconView.image = headImage
                }else{
                    iconView.image = UIImage(named: "bg")
                }
            }else{
            iconView.image = UIImage(named: imageName)
            }
            textBtn.setTitle(messageFrame?.message?.text, for: UIControlState())
            //设置气泡的背景图片
            let btnNormalImage = type == 0 ? "chat_recive_nor" : "chat_send_nor"
            let btnPressImage = type == 0 ? "chat_recive_press_pic" : "chat_send_press_pic"
            let normalImage = UIImage(named: btnNormalImage)!
    
            let leftCapWidth = Int(normalImage.size.width * 0.5)
            let topCapHeight = Int(normalImage.size.height * 0.5)
            let resizeImage = normalImage.stretchableImage(withLeftCapWidth: leftCapWidth, topCapHeight: topCapHeight)
            
            textBtn.setBackgroundImage(resizeImage, for: UIControlState())
            textBtn.setBackgroundImage(UIImage(named: btnPressImage), for: .highlighted)
            //设置frame
            timeLabel.frame = messageFrame!.timeF!
            iconView.frame = messageFrame!.iconF!
            textBtn.frame = messageFrame!.textF!
        }
    }
    

}
