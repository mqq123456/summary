//
//  RootViewController.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        nav(title: "首页")
        

        
        
        let user = UserTool.shareIntance
        user .saveData(infation: "张三", key: "name")
        user .saveData(infation: "27", key: "年龄")
        user .saveData(infation: "男", key: "性别")
        user .saveData(infation: "开发", key: "职业")
        user .saveData(infation: "和平", key: "爱好")
        let name = user.getData(key: "name")
        FDLog(message: name)
        let new = user.getData(key: "New")
        FDLog(message: new)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.push(url: "应用名称://temp")
    }

    

}
