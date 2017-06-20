//
//  WebNetworkManager.swift
//  weibo
//
//  Created by 5201-mac on 2017/4/6.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import AFNetworking


enum HTTPRequestType {
    case GET
    case POST
}
class WebNetworkManager: AFHTTPSessionManager {
    /// 静态区/常量 / 闭包 
    ///在第一次访问时，执行闭包并且将结果保存在shared常量中
    static let shared : WebNetworkManager = {
            // 实例化对象
            let instance = WebNetworkManager()
        
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
            // 设置响应反序列化支持的数据类型
            instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
            
            // 返回对象
            return instance
            
        }()
    /// 静态区／常量／闭包
    /// 在第一次访问时，执行闭包，并且将结果保存在 shared 常量中
    
    // 将成功和失败的回调写在一个逃逸闭包中(请求)
    /// 封装 AFN 的 GET / POST 请求
    ///
    /// - parameter method:     GET / POST
    /// - parameter URLString:  URLString
    /// - parameter parameters: 参数字典
    /// - parameter completion: 完成回调[json(字典／数组), 是否成功]
    
    func request(requestType :HTTPRequestType, url : String, parameters : [String : AnyObject]?, resultBlock : @escaping([String : AnyObject]?, Error?) -> ()) {
        
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj as? [String : AnyObject], nil)
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            resultBlock(nil, error)
        }
        
        // Get 请求
        if requestType == .GET {
            get(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
        
        // Post 请求
        if requestType == .POST {
            post(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
    }}
