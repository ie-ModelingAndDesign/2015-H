//
//  StartMenuView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//

import UIKit

class StartMenuView: UIViewController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "Top Page"
    
    
    // 背景色をWhiteに設定する.
    self.view.backgroundColor = UIColor.whiteColor()
    
    // ボタンを生成する.
    let Button1: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    Button1.backgroundColor = UIColor.redColor();
    Button1.layer.masksToBounds = true
    Button1.setTitle("メッセージ", forState: .Normal)
    Button1.layer.cornerRadius = 10.0
    Button1.layer.position = CGPoint(x: self.view.bounds.width/2 , y:(self.view.bounds.height/2)-20)
    Button1.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
    self.view.addSubview(Button1);
    
    
    let Button2: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    Button2.backgroundColor = UIColor.redColor();
    Button2.layer.masksToBounds = true
    Button2.setTitle("テンプレート", forState: .Normal)
    Button2.layer.cornerRadius = 10.0
    
    Button2.layer.position = CGPoint(x: self.view.bounds.width/2 , y:(self.view.bounds.height/2)+40)
    Button2.addTarget(self, action: "onClickButton:", forControlEvents: .TouchUpInside)
    
    // add tag
    Button1.tag = 1
    Button2.tag = 2
    
    // ボタンを追加する.
    self.view.addSubview(Button2);
  }
  
  internal func onClickButton(sender: UIButton){
    
    switch(sender.tag){
    
      case 1:
        let Categorypage = CategoryView()
        self.navigationController?.pushViewController(Categorypage, animated: true)
    
      case 2:
        let Templatepage = TemplatesView()
        self.navigationController?.pushViewController(Templatepage, animated: true)
      
      default:
        print("error")
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
