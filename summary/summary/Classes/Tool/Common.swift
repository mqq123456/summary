//
//  Common.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import Foundation

// MARK:- 应用常量
let APP_VERSION = "1.0"//应用版本号
let APP_DATA_VERSION = "1.0"//数据版本号
let APP_PLAT = "0"//平台IOS
let APP_CHANNEL = "appStore"//渠道名称
let WXPAY_URL = "pay/appweixin"

// MARK:- 通知常量
let PicPickerAddPhotoNote = "PicPickerAddPhotoNote"
let PicPickerRemovePhotoNote = "PicPickerRemovePhotoNote"


func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) ->(UIColor) { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

func FDLog<T> (message: T, file: String = #file, funcName: String = #function,lineNum: Int = #line) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):(\(lineNum))- \(message)");
#endif
}

let IS_IOS7 = (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0

let IS_IOS8 = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0

/**  iphone4 */
let IPHONE4 = (UIScreen.main.bounds.size.height == 480 ? true : false)
/**  iphone5 */
let IPHONE5 = (UIScreen.main.bounds.size.height == 568 ? true : false)
/**  iphone6 */
let IPhone6 = (UIScreen.main.bounds.size.height == 667 ? true : false)
/** iphone6P */
let IPhone6Plus = (UIScreen.main.bounds.size.height == 736 ? true : false)



let screenH = UIScreen.main.bounds.height - 64
let screenW = UIScreen.main.bounds.width
let startY = CGFloat(64)
// 默认图片
let placehorder = UIImage(named: "placehorder")
//判断字符串是否为空
func trimString(str: String)->String{let nowStr = str.trimmingCharacters(in: NSCharacterSet.whitespaces)
    return nowStr}
/// 单例
private let sharedKraken = TheOneAndOnlyKraken()
class TheOneAndOnlyKraken {
    class var sharedInstance: TheOneAndOnlyKraken {
        return sharedKraken
    }
}

