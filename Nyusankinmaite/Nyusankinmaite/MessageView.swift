//
//  MessageView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 12/24/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//



import Foundation
import UIKit
import RealmSwift
import SwiftyJSON


class MessageView: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  // table の値
    
  var myItems = ["aaa","bbb","ccc"]
  
  
  private var myTableView: UITableView!
  
    let deleg : AppDelegate = UIApplication.sharedApplication().delegate as!AppDelegate
    var popup = UIView()
    var sorce = UITextView()

  
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
    
    
    
    
    
    
    
    
    func popupview(i: String) {
        let w = self.view.frame.size.width
        let h = self.view.frame.size.height
        let popupw = w - 30 //横の大きさ
        let popuph = h / 2 + 20 //縦の半分
        
        popup.hidden = false
        
        popup = UIView(frame: CGRectMake(w / 2 - popupw / 2, h / 2 - popuph / 2, popupw, popuph))
        popup.backgroundColor = UIColor(red: 0.980, green: 0.980, blue: 0.824, alpha: 1) //拾ってきた
        popup.layer.borderColor = UIColor(red: 0.941, green: 0.502, blue: 0.502, alpha: 1).CGColor //CGColorは肩合わせ
        popup.layer.borderWidth = 8 //枠の幅
        popup.layer.cornerRadius = 20 //丸くする
        self.view.addSubview(popup)
        
        let sorcew = popupw - 30
        let sorceh =  popuph / 2 + 20
        
        sorce = UITextView(frame: CGRectMake(popupw / 2 - sorcew / 2, 20, sorcew, sorceh))
        sorce.backgroundColor = UIColor.whiteColor()
        sorce.layer.cornerRadius = 7 //丸くする
        sorce.text = i
        sorce.font = UIFont.systemFontOfSize(16)
        popup.addSubview(sorce)
        
        let copyw = popupw - 30
        let copyh = popuph / 6 - 10
        
        let copybtn = UIButton(frame: CGRectMake(popupw / 2 - copyw / 2, sorce.frame.origin.y + sorceh + 6, copyw, copyh))
        copybtn.backgroundColor = UIColor(red: 0.627, green: 0.322, blue: 0.176, alpha: 1)
        
        copybtn.layer.cornerRadius = 7 //丸くする
        
        //表示されるテキスト
        copybtn.setTitle("コピー", forState: .Normal)
        //テキストの色
        copybtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        copybtn.addTarget(self, action: "cp", forControlEvents: .TouchDown)
        
        popup.addSubview(copybtn)
        
        let closew = popupw - 30
        let closeh = popuph / 6 - 10
        
        let closebtn = UIButton(frame: CGRectMake(popupw / 2 - closew / 2, copybtn.frame.origin.y + closeh+4
            , closew, closeh))
        closebtn.backgroundColor = UIColor(red: 0.627, green: 0.322, blue: 0.176, alpha: 1)
        
        closebtn.layer.cornerRadius = 7 //丸くする
        
        //表示されるテキスト
        closebtn.setTitle("閉じる", forState: .Normal)
        //テキストの色
        closebtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        closebtn.addTarget(self, action: "close", forControlEvents: .TouchDown)
        popup.addSubview(closebtn)
    }
    
    func cp(){
        let rev = sorce.text
        UIPasteboard.generalPasteboard().string = rev
    }
    
    func close(){
        self.popup.hidden = true
        
    }

}