//
//  MessageFrame.swift
//  1.黑马QQ
//
//  Created by NeXTSTEP on 16/7/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

//声明一个全局的坚决
let margin: CGFloat = 8
let iconW: CGFloat = 50
let textFont = UIFont.systemFont(ofSize: 14)
class MessageFrame: NSObject {
    
    //时间
    var timeF: CGRect?
    //头像
    var iconF: CGRect?
    //消息记录
    var textF: CGRect?
    
    //行高
    var rowHeight: CGFloat = 0
    var message: Message? {
        didSet{
            //获取屏幕的宽度
            let screenWidth = UIScreen.main.bounds.width
            
            //根据数据设置子空间的frame
            if (message!.hiddenTime == true) {
                timeF = CGRect.zero
            } else {
                timeF = CGRect(x: 0, y: 1, width: screenWidth, height: 12)
            }
           
            
            let messageType = message?.type ?? 0
            //设置iconF
            iconF = CGRect(x: (messageType == 0) ? margin : (screenWidth - iconW - margin), y: timeF!.maxY + margin, width: iconW, height: iconW)
            //设置消息记录的frame
            let textMaxSize = CGSize(width: screenWidth - 2 * iconW - 4 * margin - 40 , height: CGFloat(MAXFLOAT))
            
            let textS = textSize(message?.text ?? "", font: textFont, maxSize: textMaxSize)
            let textX = (messageType == 0) ? iconF!.maxX + margin : (screenWidth - 2 * margin - iconW - textS.width - 40)
            textF = CGRect(x: textX, y: iconF!.origin.y, width: textS.width + 40, height: textS.height + 40)
            let textMaxY = textF!.maxY
            let iconMaxY = iconF!.maxY
            rowHeight = max(textMaxY, iconMaxY) + margin
            
        }
    }
    
    
    //根据字号 和 最大的设置尺寸来计算文字的大小
    func textSize(_ text: String, font: UIFont, maxSize: CGSize) -> CGSize {
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName : font], context: nil).size
    }
    
}
