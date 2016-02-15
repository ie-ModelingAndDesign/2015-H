//
//  CategoryView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//
import UIKit
import RealmSwift



class TemplatesView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var leftBarButton: UIBarButtonItem!
    
    // table の設定
    private let myItems: NSArray = ["開発中です",]
    private var myTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景を white に設定
        self.view.backgroundColor = UIColor(red:(255.0)/255.0, green:(240.0)/255.0, blue: (245.0)/255.0, alpha:1)
        
        
        
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
        self.navigationItem.title = "テンプレート"
    }
    
    
    
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.myTableView.backgroundColor = UIColor(red: 0.980, green: 0.980, blue: 0.824, alpha: 0.2)
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
        cell.backgroundColor = UIColor(red: 0.980, green: 0.980, blue: 0.824, alpha: 0.1)
        // 選択された時の背景色
        var cellSelectedBgView = UIView()
        cellSelectedBgView.backgroundColor = UIColor(red:(240.0)/255.0, green: (128.0)/255.0, blue: (128.0)/255.0, alpha: 0.5)
        cell.selectedBackgroundView = cellSelectedBgView
        
        
        return cell
    }
    
    
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}