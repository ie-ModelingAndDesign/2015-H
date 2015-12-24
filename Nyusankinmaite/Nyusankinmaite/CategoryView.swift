//
//  CategoryView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//
import UIKit

class CategoryView: UIViewController {
  
  var leftBarButton: UIBarButtonItem!
  private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
  private var myTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Status Barの高さを取得する.
    let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
    
    // Viewの高さと幅を取得する.
    let displayWidth: CGFloat = self.view.frame.width
    let displayHeight: CGFloat = self.view.frame.height
    
    // TableViewの生成する(status barの高さ分ずらして表示).
    myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
    
    // Cell名の登録をおこなう.
    myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    
    // DataSourceの設定をする.
    //myTableView.dataSource = self
    
    // Delegateを設定する.
    //myTableView.delegate = self
    
    // Viewに追加する.
    self.view.addSubview(myTableView)
    
    
    
    self.navigationItem.title = "カテゴリー"
    
    self.view.backgroundColor = UIColor.whiteColor()
  }
  

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}