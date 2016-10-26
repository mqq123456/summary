//
//  NSStringUrldecode.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import Foundation

public extension NSString {
    // MARK: - 反序列化
    func stringByDecodingURLFormat() -> NSString {
        var result = self.replacingOccurrences(of: "+", with: " ")
        result = result.replacingPercentEscapes(using: String.Encoding.utf8)!
        //result = result.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        return result as NSString
    }
}
