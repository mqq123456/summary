//
//  UserTool.swift
//  summary
//
//  Created by HeQin on 16/8/16.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit
// MARK:- 尝试用plist存储用户信息
//本想发主要是想通过前端和后端一起实现,但是又觉得归档好蛋疼
//还有就是用userDefaut，参见文件userdefaut
class UserTool: NSObject {
    let filePath:String = NSHomeDirectory() + "/Documents/userInformation.plist"
    static let shareIntance : UserTool = UserTool()
    internal func saveData(infation: NSString, key: NSString) {
        guard let resultDict = NSMutableDictionary(contentsOfFile: filePath) else {
            return
        }
        resultDict.setObject(infation, forKey: key)
        resultDict.write(toFile: filePath, atomically: true)
    }
    
    internal func getData(key: String) -> String {
        
        guard let resultDict = NSDictionary(contentsOfFile: filePath) else {
            return String()
        }
        guard let resultString = resultDict.object(forKey: key) else {
            return String()
        }
        return resultString as! String

    }
}

