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
    
    @IBOutlet var timerLabel: UILabel!
    
    var timer: Timer = Timer()
    var time: Int = 180
    
    var randomAlphabet: Int!
    var randomOdai: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCount), userInfo: nil, repeats: true)
        
        let realm = try! Realm()
        let alphabetData = realm.objects(Gojuon.self)
        let odaiData = realm.objects(Odai.self)
        
        randomAlphabet = Int.random(in: 0 ..< alphabetData.count)
        randomOdai = Int.random(in: 0 ..< odaiData.count)
        
        odaiLabel.adjustsFontSizeToFitWidth = true
        
        alphabetLabel.text = "「" + alphabetData[randomAlphabet].alphabet + "」からはじまる"
        odaiLabel.text = odaiData[randomOdai].question
    }
    
    
    
    
    @objc func updateCount(){
        if time == 0{
            timer.invalidate()
            timerLabel.text = "解答を始めてください"
        }else{
            let minute = time / 60
            let second = time % 60
            timerLabel.text = "シンキングタイムの残り \(minute):" + String(format: "%02d", second)
            time = time - 1
        }
    }
    
    
    //値を送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInputAnswer"{
            let inputAnswerViewController = segue.destination as! inputAnswerViewController
            inputAnswerViewController.people = self.people
            inputAnswerViewController.name = self.name
            inputAnswerViewController.alphabetId = self.randomAlphabet
            inputAnswerViewController.odaiId = self.randomOdai
        }
    }
    
    @IBAction func shuffle(){
        let realm = try! Realm()
        let alphabetData = realm.objects(Gojuon.self)
        let odaiData = realm.objects(Odai.self)
        
        randomAlphabet = Int.random(in: 0 ..< alphabetData.count)
        randomOdai = Int.random(in: 0 ..< odaiData.count)
        
        alphabetLabel.text = "「" + alphabetData[randomAlphabet].alphabet + "」からはじまる"
        odaiLabel.text = odaiData[randomOdai].question
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
