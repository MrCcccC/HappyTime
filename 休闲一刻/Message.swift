//
//  Message.swift
//  1.黑马QQ
//
//  Created by NeXTSTEP on 16/7/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class Message: NSObject {
    //聊天记录
    var text: String?
    //时间
    var time: String?
    //聊天的角色  1 代表自己 0代表其他人
    var type: Int = 0
    
    var hiddenTime = false
    
    init(dict: [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}

