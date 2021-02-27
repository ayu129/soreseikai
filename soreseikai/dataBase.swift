//
//  dataBase.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/27.
//

import Foundation
import RealmSwift

class Gojuon: Object{
    @objc dynamic var id = 0
    @objc dynamic var alphabet = ""
}

class Odai: Object{
    @objc dynamic var id = 0
    @objc dynamic var question = ""
}
