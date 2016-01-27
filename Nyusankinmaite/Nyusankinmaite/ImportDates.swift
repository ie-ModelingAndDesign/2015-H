//
//  ImportFile.swift
//  Nyusankinmaite
//
//  Created by 山城　沙綾 on 2015/12/26.
//  Copyright © 2015年 Ryuki. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import RealmSwift
import SwiftyJSON


  let deleg : AppDelegate = UIApplication.sharedApplication().delegate as!AppDelegate

class ImportDates {
    let wordPath: String = NSBundle.mainBundle().pathForResource("Word", ofType: "json")!
    
    func run() {
        let wordPath: String = NSBundle.mainBundle().pathForResource("Word", ofType: "json")!
        var i = 0
        let realm = try! Realm()
        if let wordData = NSData(contentsOfFile: wordPath) {
            let json = JSON.init(data: wordData)
            for j in json {
                let insData: Sentence = Sentence()
                i++
                insData.cat = j.1["cat"].asInt!
                insData.eng = j.1["eng"].asString!
                insData.jap = j.1["jap"].asString!
                insData.id = i
                
                try! realm.write({
                    realm.add(insData)
                })
            }
        }
    }
}
