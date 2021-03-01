//
//  ResultViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/28.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    var alphabetId: Int!
    var odaiId: Int!
    
    @IBOutlet var odaiLabel: UILabel!
    
    @IBOutlet var answerLabel: UILabel!
    
    var answer: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let realm = try! Realm()
        let alphabetData = realm.objects(Gojuon.self)
        let odaiData = realm.objects(Odai.self)
        
        let finalAnser = Answer()
        finalAnser.alphabetId = alphabetId
        finalAnser.odaiId = odaiId
        finalAnser.finalAnswer = answer
        
        try! realm.write {
            realm.add(finalAnser)
        }
        
        
        odaiLabel.text = "「" + alphabetData[alphabetId].alphabet + "」からはじまる" + odaiData[odaiId].question
        odaiLabel.adjustsFontSizeToFitWidth = true
        odaiLabel.textAlignment = NSTextAlignment.center
        
        answerLabel.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAnotherAnswers"{
            let showViewController = segue.destination as! showAnotherAnswersViewController
            showViewController.alphabetId = self.alphabetId
            showViewController.odaiId = self.odaiId
        }
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
