//
//  UITableViewExtensions.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import Foundation
public extension UITableView {
    // MARK: - init
    convenience init (frame : CGRect, style : UITableViewStyle, backgroundColor: UIColor, showsVertical: Bool, showsHorizontal: Bool ,register: String) {
        self.init(frame: frame, style: style)
        self.backgroundColor = backgroundColor
        self.showsVerticalScrollIndicator = showsVertical
        self.showsHorizontalScrollIndicator = showsHorizontal
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}
