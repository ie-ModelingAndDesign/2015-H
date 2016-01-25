//
//  CategoryView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//
import UIKit
import RealmSwift



class CategoryView: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  var leftBarButton: UIBarButtonItem!
  
  // table の設定
  private let myItems: NSArray = ["卒業", "入学", "誕生日","クリスマス","バレンタイン","挨拶","誘い","勘定","志願・希望","感謝","謝罪","寂しい","嬉しい","悲しい","楽しい","怒り","褒め言葉","お正月","告白","その他","ホワイトデー","愛と伝える","励まし",]
  private var myTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 背景を white に設定
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
    self.navigationItem.title = "カテゴリー"
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
    let Messagepage = MessageView()
    let selCategory = "\(myItems[indexPath.row])"
    let app:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    app.globalStrings01 = selCategory
    app.globalcategory = indexPath.row + 1
    self.navigationController?.pushViewController(Messagepage, animated: true)
  }
  
  

  

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}