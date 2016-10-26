//
//  RootTableViewController.swift
//  summary
//
//  Created by HeQin on 16/8/15.
//  Copyright © 2016年 HeQin. All rights reserved.
//

import UIKit

class RootTableViewController: RootViewController {
    
    
    lazy var myTableView : UITableView = UITableView(frame: CGRect(x: 0, y: startY, w: screenW, h: screenH), style: .plain, backgroundColor: UIColor.groupTableViewBackground, showsVertical: false, showsHorizontal: false, register: "cell")
    
    lazy var activity: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    var dataArray : NSMutableArray = NSMutableArray()
    
    var page : Int! = nil
    
    var haveMJRefresh : Bool = false {
        didSet {
            if haveMJRefresh {
                self.setupDownRefresh()
                self.setupUpRefresh()
            }
            
        }
    }
    
   
    func MJRefreshTop() {
        
    }
    func MJRefreshMore() {
        
    }
    
    let header = MJRefreshNormalHeader()
    func setupDownRefresh() {
        header.setRefreshingTarget(self, refreshingAction: #selector(MJRefreshTop))
        self.myTableView.mj_header = header
    }
    let footer = MJRefreshAutoNormalFooter()
    func setupUpRefresh() {
        footer.setRefreshingTarget(self, refreshingAction:#selector(MJRefreshMore))
        self.myTableView.mj_footer = footer
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myTableView)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        let user = UserTool.shareIntance
        let name = user.getData(key: "年龄")
        FDLog(message: name)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
}

extension RootTableViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
}

