//
//  UIViewControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - 导航栏
    public func nav(title: String) {
        self.view.addSubview(NavigationView(title: title, callBack: {[weak self]()->() in
            self!.navigationController?.popViewController(animated: true)
        }))
        
    }
    // MARK: - 根据规定的字符串跳转
    public func push(url: NSString) {
        if url.hasPrefix("应用名称://") {
            // 0.获取命名空间
            guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
                FDLog(message: "没有获得命名空间")
                return
            }
            
            let head = url.components(separatedBy: "应用名称://") as NSArray
            guard head.count>1 else {
                return
            }
            let name = head[1] as! String
            
            // 1.根据字符串获取对应的Class
            guard let ChildVcClass = NSClassFromString(nameSpace + "." + name + "ViewController") else {
                FDLog(message: "没有获取到字符串对应的Class")
                return
            }
            
            // 2.将对应的AnyObject转成控制器的类型
            guard let childVcType = ChildVcClass as? UIViewController.Type else {
                FDLog(message: "没有获取对应控制器的类型")
                return
            }
            
            // 3.创建对应的控制器对象
            let childVc = childVcType.init()
            self.navigationController?.pushViewController(childVc, animated: true)
        }
    }
   
    // MARK: - VC Container
    /// EZSwiftExtensions
    public var top: CGFloat {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.top
            }
            if let nav = self.navigationController {
                if nav.isNavigationBarHidden {
                    return view.top
                } else {
                    return nav.navigationBar.bottom
                }
            } else {
                return view.top
            }
        }
    }

    /// EZSwiftExtensions
    public var bottom: CGFloat {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.bottom
            }
            if let tab = tabBarController {
                if tab.tabBar.isHidden {
                    return view.bottom
                } else {
                    return tab.tabBar.top
                }
            } else {
                return view.bottom
            }
        }
    }

    /// EZSwiftExtensions
    public var tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }

    /// EZSwiftExtensions
    public var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            return 0
        }
    }

    /// EZSwiftExtensions
    public var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }


}
