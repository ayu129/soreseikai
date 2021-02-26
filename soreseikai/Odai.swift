//
//  Odai.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import Foundation
import RealmSwift


class Odai: Object{
    dynamic var id = 0
    dynamic var odai = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }

    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
