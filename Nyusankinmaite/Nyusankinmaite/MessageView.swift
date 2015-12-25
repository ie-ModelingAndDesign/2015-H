//
//  MessageView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 12/24/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//




import UIKit

class MessageView: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  // table の値
  var myItems = ["aaa","bbb","ccc"]
  
  
  private var myTableView: UITableView!
  
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.whiteColor()
    
    
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
    myTableView.dataSource = self
    
    // Delegateを設定する.
    myTableView.delegate = self
    // Viewに追加する.
    self.view.addSubview(myTableView)
    
    
    // title を設定
    self.navigationItem.title = "メッセージ"
  }
  
  
  
  
  /*
  Cellの総数を返すデータソースメソッド.
  (実装必須)
  */
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myItems.count
  }
  
  /*
  Cellに値を設定するデータソースメソッド.
  (実装必須)
  */
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)
    myItems[0] = app.globalStrings01!

    
    // 再利用するCellを取得する.
    let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
    
    // Cellに値を設定する.
    cell.textLabel!.text = "\(myItems[indexPath.row])"
    
    return cell
  }
  
  
  
  /*
  Cellが選択された際に呼び出されるデリゲートメソッド.
  */
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("Num: \(indexPath.row)")
    print("Value: \(myItems[indexPath.row])")
  }

  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}