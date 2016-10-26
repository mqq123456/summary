//
//  AppDelegate.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        self.window!.frame = UIScreen.main.bounds
        
        //初始化控制器
        initRootViewController()
        
        self.window?.makeKeyAndVisible()
        //注册消息推送
        self.initUMessage(launchOptions: launchOptions)
        
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.orange

        
  
        //打印沙盒目录
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                FileManager.SearchPathDomainMask.userDomainMask, true)
    
        FDLog(message: documentPaths)
        
        let version = (Bundle.main.infoDictionary as! NSDictionary).object(forKey: "CFBundleShortVersionString")as! NSString
        FDLog(message: version);

        
        return true
    }
    
    private func initRootViewController() {
        window?.rootViewController = UINavigationController(rootViewController: RootViewController())
    }
    //1.推送接收
    private func initUMessage(launchOptions: [NSObject: AnyObject]?) {
        if (UIDevice.current.systemVersion.compare("8.0.0") == .orderedSame || UIDevice.current.systemVersion.compare("8.0.0") == .orderedDescending){
            let action1 = UIMutableUserNotificationAction();
            action1.identifier = "action1_identifier"
            action1.title = "Accept"
            action1.activationMode = UIUserNotificationActivationMode.foreground//当点击的时候启动程序
            
            let action2 = UIMutableUserNotificationAction();//第二按钮
            action2.identifier = "action2_identifier"
            action2.title = "Reject"
            action2.activationMode = UIUserNotificationActivationMode.background
            action2.isAuthenticationRequired = true
            action2.isDestructive = true
            
            let categorys = UIMutableUserNotificationCategory();
            categorys.identifier = "category1";//这组动作的唯一标示
            categorys.setActions([action1, action2], for: UIUserNotificationActionContext.default)
            
            
            let userSettings = UIUserNotificationSettings(types:[
                .badge,
                .sound,
                .alert],
                                                          categories: Set(arrayLiteral: categorys))
            
            //UMessage.registerRemoteNotificationAndUserNotificationSettings(userSettings)
        } else {
            //UMessage.registerForRemoteNotificationTypes([.Badge, .Sound, .Alert])
        }
    }

    //2.DEBUG
    public func FDLog<T>(message: T, file: String = #file, funcName: String = #function,lineNum: Int = #line) {
        #if DEBUG
            let fileName = (file as NSString).lastPathComponent
            print("\(fileName):(\(lineNum))-\(message)");
        #endif
    }

}

