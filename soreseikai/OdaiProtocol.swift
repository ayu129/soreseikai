//
//  OdaiProtocol.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import Foundation
import RealmSwift

protocol OdaiProtocol{
    associatedtype ObjectType: Object
    static var values: [[Any]] { get }
    static func items() -> Odai
}

extension OdaiProtocol{
    static func items() -> Odai {
        return values.map { val in
                let t = Odai()
                t.id = val[0] as! Int
                t.odai = val[1] as! String
                return t
        }
    }
}

