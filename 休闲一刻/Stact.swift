//
//  Stact.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/30.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import Foundation
import UIKit

 var userLogon : Bool?
 var TypeH:Bool = false
 var type : String = "top"
 var typeName : String = "头条"
 let  isSuccess = "Success"
 var headImage : UIImage!
var Dict:[String:Any]!
var user:String!
var Gexing : String!
var Nicheng: String!
var userID : String!
var ImgURL : String!
func toolsChangeToJson(info: Any) -> String{
    //首先判断能不能转换
    guard JSONSerialization.isValidJSONObject(info) else {
        print("json转换失败")
        return ""
    }
    //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
    let jsonData = try? JSONSerialization.data(withJSONObject: info, options: [])
    
    if let jsonData = jsonData {
        let str = String(data: jsonData, encoding: String.Encoding.utf8)
        return str ?? ""
    }else {
        return ""
    }
    
}
