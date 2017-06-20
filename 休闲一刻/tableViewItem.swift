//
//  tableViewItem.swift
//  weibo
//
//  Created by 5201-mac on 2017/4/7.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class tableViewItem: NSObject {
    var Title :  String?
    var ImgURL: String?
    var Time:String?
    var Description: String?
    var URL:String?
    /*
     "uniquekey":"dff3e2ba690889840a8994e226ae1bc8",
     "title":"小偷盗窃被主人素描画吸引 没拿走钱留下QQ求画",
     "date":"2017-04-12 13:08",
     "category":"头条",
     "author_name":"齐鲁晚报",
     "url":"http:\/\/mini.eastday.com\/mobile\/170412130823328.html",
     "thumbnail_pic_s":"http:\/\/07.imgmini.eastday.com\/mobile\/20170412\/20170412130823_ed9e68d60a8d4b2801fc09f6dc951085_5_mwpm_03200403.png",
     "thumbnail_pic_s02":"http:\/\/07.imgmini.eastday.com\/mobile\/20170412\/20170412130823_ed9e68d60a8d4b2801fc09f6dc951085_3_mwpm_03200403.png",
     "thumbnail_pic_s03":"http:\/\/07.imgmini.eastday.com\/mobile\/20170412\/20170412130823_ed9e68d60a8d4b2801fc09f6dc951085_2_mwpm_03200403.png"   
     */

    init(dict:AnyObject) {
        super.init()
        self.Time = dict["category"] as? String
        self.Title = dict["date"] as? String
        self.Description = dict["title"] as? String
        self.ImgURL = dict["thumbnail_pic_s"] as? String
        self.URL = dict["url"] as? String

//         self.newsURL = dict["docurl"] as? String
//        self.newsType = dict["channelname"] as? String
    }


}
