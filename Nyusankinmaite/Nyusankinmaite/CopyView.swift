//
//  CopyView.swift
//  Nyusankinmaite
//
//  Created by 山城　沙綾 on 2015/11/27.
//  Copyright © 2015年 Ryuki. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
//import SwiftyJSON

class CopyView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let deleg : AppDelegate = UIApplication.sharedApplication().delegate as!AppDelegate
    
    
    
    // Tableで使用する配列を定義する.
    
    
    private let myiPhoneItems: NSArray = ["iOS8", "iOS7", "iOS6", "iOS5", "iOS4"]
    private let myAndroidItems: NSArray = ["5.x", "4.x", "2.x", "1.x"]
    
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["iPhone", "Android"]
    
    var popup = UIView()
    var sorce = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(deleg.category)
        // Status Barの高さを取得を.する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    セクションの数を返す.
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mySections.count
    }
    
    /*
    セクションのタイトルを返す.
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            print("Value: \(myiPhoneItems[indexPath.row])")
            popupview(String(myiPhoneItems[indexPath.row]))
        } else if indexPath.section == 1 {
            print("Value: \(myAndroidItems[indexPath.row])")
            popupview(String(myiPhoneItems[indexPath.row]))
        }
        
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myiPhoneItems.count
        } else if section == 1 {
            return myAndroidItems.count
        } else {
            return 0
        }
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myiPhoneItems[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myAndroidItems[indexPath.row])"
        }
        
        return cell
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


