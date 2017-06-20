//
//  Happytable.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/12.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class Happytable: NSObject {
    var content :  String?
    var updatetime : String?
    var cellHeight : CGFloat?
    
  /*  
     {
				"content":"一位小姐约她的很是腼腆的男朋友出去玩,过了一会儿,男的说道:\"对不起,我要方便一下,但不知道哪儿可以。\"女的明白是什么意思,就领他到了附近的厕所,男的出来以后,女的问他:\"你什么时候去我家?\"男的想了想说道:\"就在你方便的时候吧.\"",
				"hashId":"98312f0e6d9c78ea2c8a025f2ef220c7",
				"unixtime":1491966230,
				"updatetime":"2017-04-12 11:03:50"
    },
*/
    init(dict:AnyObject) {
        super.init()
        self.content = dict["content"] as? String
        self.updatetime = dict["updatetime"] as? String
        // self.newsURL = dict["docurl"] as? String
        //self.newsType = dict["channelname"] as? String
    }

}
