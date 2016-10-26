//
//  LabelExtensions.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import Foundation

public extension UILabel {
    // MARK: - init
    convenience init (text : String, fontSize : CGFloat, textColor: UIColor) {
        self.init()
        self.text = text;
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
    }

}
