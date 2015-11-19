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
    
    // 背景色をGreenに設定する.
    self.view.backgroundColor = UIColor.whiteColor()
    
    // ボタンを生成する.
    let Button1: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    Button1.backgroundColor = UIColor.redColor();
    Button1.layer.masksToBounds = true
    Button1.setTitle("メッセージ", forState: .Normal)
    Button1.layer.cornerRadius = 10.0
    Button1.layer.position = CGPoint(x: self.view.bounds.width/2 , y:(self.view.bounds.height/2)-20)
    Button1.addTarget(self, action: "onClickMassageButton:", forControlEvents: .TouchUpInside)
    self.view.addSubview(Button1);

    
    let Button2: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    Button2.backgroundColor = UIColor.redColor();
    Button2.layer.masksToBounds = true
    Button2.setTitle("テンプレート", forState: .Normal)
    Button2.layer.cornerRadius = 10.0
    
    Button2.layer.position = CGPoint(x: self.view.bounds.width/2 , y:(self.view.bounds.height/2)+40)
    Button2.addTarget(self, action: "onClickTemplatesButton:", forControlEvents: .TouchUpInside)
    
    // ボタンを追加する.
    self.view.addSubview(Button2);
  }
  
  /*
  ボタンイベント.
  */
  internal func onClickMassageButton(sender: UIButton){
    
    // 遷移するViewを定義する.
    let category: UIViewController = CategoryView()
    
    // アニメーションを設定する.
    category.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    
    // Viewの移動する.
    self.presentViewController(category, animated: true, completion: nil)
  }
  
  internal func onClickTemplatesButton(sender: UIButton){
    
    // 遷移するViewを定義する.
    let mySecondViewController: UIViewController = TemplatesView()
    
    // アニメーションを設定する.
    mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    
    // Viewの移動する.
    self.presentViewController(mySecondViewController, animated: true, completion: nil)
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}