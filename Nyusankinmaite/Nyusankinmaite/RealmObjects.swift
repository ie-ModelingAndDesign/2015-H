//
//  RealmObjects.swift
//  Nyusankinmaite
//
//  Created by 山城　沙綾 on 2015/12/17.
//  Copyright © 2015年 Ryuki. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var owner: Person?
}

class Person: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""
}


class Sentence :Object {
    dynamic var id: Int = 0
    dynamic var cat: Int = 0
    dynamic var jap: String = ""
    dynamic var eng: String = ""
    
}
