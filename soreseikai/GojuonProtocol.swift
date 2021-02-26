//
//  GojuonProtocol.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import Foundation
import RealmSwift


protocol GojuonProtocol{
    associatedtype ObjectType: Object
    static var values: [[Any]] { get }
    static func items() -> Gojuon
}

extension GojuonProtocol{
    static func items() -> Gojuon {
        return values.map { val in
                let t = Gojuon()
                t.id = val[0] as! Int
                t.alphabet = val[1] as! String
                return t
        }
    }
}
