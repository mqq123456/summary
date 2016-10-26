//
//  NetworkTools.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

// 定义枚举类型
enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager {
    // let是线程安全的
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
    }()
}
// MARK:- 封装请求方法
extension NetworkTools {
    func request(methodType : RequestType, urlString : String, parameters : [String : AnyObject], finished : @escaping (_ result : AnyObject?, _ error : NSError?) -> ()) {
        
        // 1.定义成功的回调闭包
        let successCalURLSessionDataTaskBack = { (task : URLSessionDataTask?, result : AnyObject?) -> Void in
            finished(result, nil)
        }
        
       
        // 2.定义失败的回调闭包
        let failureCalURLSessionDataTaskBack = { (task : URLSessionDataTask?, error : NSError) -> Void in
            finished(nil, error)
        }
        
        // 3.发送网络请求
        /*
       if methodType == .GET {
            self.get(urlString, parameters: parameters, progress: nil, success: successCalURLSessionDataTaskBack, failure: { (<#URLSessionDataTask?#>, <#Error#>) in
                <#code#>
            })
            self.get(urlString, parameters: parameters, progress: nil, success: successCalURLSessionDataTaskBack, failure: failureCalURLSessionDataTaskBack)
        } else {
            self.post(urlString, parameters: parameters, progress: nil, success: successCalURLSessionDataTaskBack, failure: failureCalURLSessionDataTaskBack)
        }
        */
    }
}


