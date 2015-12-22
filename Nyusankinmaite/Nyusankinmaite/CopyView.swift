//
//  CopyView.swift
//  Nyusankinmaite
//
//  Created by 山城　沙綾 on 2015/11/27.
//  Copyright © 2015年 Ryuki. All rights reserved.
//

import Foundation
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
>>>>>>> saaya
import UIKit

class CopyView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Tableで使用する配列を定義する.
    private let myiPhoneItems: NSArray = ["iOS8", "iOS7", "iOS6", "iOS5", "iOS4"]
    private let myAndroidItems: NSArray = ["5.x", "4.x", "2.x", "1.x"]
    
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["iPhone", "Android"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        } else if indexPath.section == 1 {
            print("Value: \(myAndroidItems[indexPath.row])")
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
    
<<<<<<< HEAD
}
>>>>>>> Stashed changes
=======
}
>>>>>>> saaya
