//
//  CategoryView.swift
//  Nyusankinmaite
//
//  Created by Ryuki on 11/19/15.
//  Copyright © 2015 Ryuki. All rights reserved.
//

import UIKit

class TemplatesView: UIViewController {
  
  var leftBarButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "テンプレート"
    
    self.view.backgroundColor = UIColor.whiteColor()
  }
  

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}