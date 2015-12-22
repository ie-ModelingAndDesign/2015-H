//
//  CategoryView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//

import UIKit

class CategoryView: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 背景色を設定.
    self.view.backgroundColor = UIColor.whiteColor()
    
    
    let Button1: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    Button1.backgroundColor = UIColor.redColor();
    Button1.layer.masksToBounds = true
    Button1.setTitle("喜び", forState: .Normal)
    Button1.layer.cornerRadius = 10.0
    Button1.layer.position = CGPoint(x: self.view.bounds.width/2 , y:(self.view.bounds.height/2)-20)
    Button1.addTarget(self, action: "onClickMassageButton:", forControlEvents: .TouchUpInside)
    self.view.addSubview(Button1);

    
    
    // ボタンを作成.
    let backButton: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
    backButton.backgroundColor = UIColor.redColor();
    backButton.layer.masksToBounds = true
    backButton.setTitle("Back", forState: .Normal)
    backButton.layer.cornerRadius = 20.0
    backButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
    backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
    self.view.addSubview(backButton);
  }
    internal func onClickMassageButton(sender: UIButton){
        
        // 遷移するViewを定義する.
        let category: UIViewController = CopyView()
        
        // アニメーションを設定する.
        category.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動する.
        self.presentViewController(category, animated: true, completion: nil)
    }
    
  
  /*
  ボタンイベント.
  */
  internal func onClickMyButton(sender: UIButton){
    
    // 遷移するViewを定義.
    let myViewController: UIViewController = StartMenuView()
    
    // アニメーションを設定.
    myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    
    // Viewの移動.
    self.presentViewController(myViewController, animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
