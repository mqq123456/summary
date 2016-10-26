//
//  NavigationView.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    var callBack : (() -> ())?
    
    convenience init(title: String, callBack : @escaping () -> ()) {
        self.init()
        self.callBack = callBack
        backgroundColor = UIColor.white
        self.frame = CGRect(x: 0, y: 0, w: screenW, h: 64)
        
        let backBtn = UIButton.init(x: 0, y: 20, w: 44, h: 44, target: self, action:#selector(backBtnClick))
        backBtn.setImage(UIImage(named: "back_btn"), for: UIControlState(rawValue: UInt(0)))
        backBtn.setImage(UIImage(named: "back_btn"), for: .highlighted)
        addSubview(backBtn)
        
        if title.hasPrefix("首页") {
            backBtn.isHidden = true
        }
        let label  = UILabel(text: title, fontSize: 17, textColor: UIColor.black)
        label.frame = CGRect(x: 50, y: 20, width: screenW-100, height: 44)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        addSubview(label)
        
        let line = UIView(x: 0, y: 63.5, w: screenW, h: 0.5)
        
        line.backgroundColor = UIColor.lightGray
        addSubview(line)
    }
  
 

}


// MARK:- 点击事件
extension NavigationView {
    @objc func backBtnClick() {
        callBack!()
    }
}

