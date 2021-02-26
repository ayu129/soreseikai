//
//  dataBase.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/24.
//

import Foundation
import RealmSwift

//五十音の設定
//class Gojuon: Object{
//    dynamic var id = 0
//    dynamic var alphabet = ""
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//
//    override static func indexedProperties() -> [String] {
//        return ["id"]
//    }
//}

let moji: [String] = ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","が","ぎ","ぐ","げ","ご","ざ","じ","ず","ぜ","ぞ","だ","ど","ぱ","ぴ","ぷ","ぺ","ぽ","ば","び","ぶ","べ","ぼ"]





//let realm = try! Realm()
//    for i in 0 ..< moji.count{
//        let gojuon = Gojuon()
//        gojuon.alphabet = moji[i]
//        gojuon.id = i
//        try! realm.write() {
//            realm.add(gojuon)
//        }
//    }


//お題の設定
//class Odai: Object{
//    dynamic var id = 0
//    dynamic var odai = ""
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//
//    override static func indexedProperties() -> [String] {
//        return ["id"]
//    }
//}

let question: [String] = ["さらりと言えたらかっこいい言葉","彼氏に言われてキュンとくる一言","母親がよく言う一言","日本の名曲","中華料理の定番メニュー","テンションの上がる出来事","人にあげて喜ばれるもの","プロスポーツ選手に必要なもの","メガネが似合う有名人","夏休みの定番行事","滅多に食べられないご馳走","お父さんが娘に嫌われること","家にないと困るもの","頭を使うもの","悲しい出来事","見るべきもの","難しいもの","子供の頃から学ぶべきもの","懐かしいもの","覚えているとかっこいいもの"]

//do{
//    for i in 0 ..< question.count{
//        let odai = Odai()
//        odai.id = i
//        odai.odai = question[i]
//        try! realm.write() {
//            realm.add(odai)
//        }
//    }
//}
