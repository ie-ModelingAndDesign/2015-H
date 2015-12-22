//
//  TestViewController.swift
//  Nyusankinmaite
//
//  Created by 山城　沙綾 on 2015/12/17.
//  Copyright © 2015年 Ryuki. All rights reserved.
//

import UIKit
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
import RealmSwift
>>>>>>> Stashed changes
=======
import RealmSwift
>>>>>>> saaya

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
>>>>>>> saaya
        let realm = try! Realm() //アクセス
        print(realm.configuration.path!)
        
        for i in 0..<100 {
            let dog: Dog = Dog()
            dog.id = i
            dog.name = "poch" + String(i)
            try! realm.write({
                realm.add(dog)
            })
        }
        
        let dogs = realm.objects(Dog)
        
        for d in dogs {
            print(d.name)
        }
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> saaya

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
