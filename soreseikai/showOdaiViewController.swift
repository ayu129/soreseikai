//
//  showOdaiViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/24.
//

import UIKit
import RealmSwift

class showOdaiViewController: UIViewController {
    
    var people: Int!
    var name: [String]!
    
    @IBOutlet var alphabetLabel: UILabel!
    @IBOutlet var odaiLabel: UILabel!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moji = realm.objects(Gojuon.self)
        let odai = realm.objects(Odai.self)
        // Do any additional setup after loading the view.
        print(moji)
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
