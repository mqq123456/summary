//
//  tempViewController.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit

class tempViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
        nav(title: "第二页")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 禁止横话返回
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ((self.navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer))) != nil) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if ((self.navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer))) != nil) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(temp1ViewController(), animated: true)
    }
}

