//
//  secondViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/23.
//

import UIKit

class secondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var pickerView: UIPickerView!
    let numberOfPeople:[Int] = ([Int])(1...6)
    var people: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    //PickerViewのコンポーネントの数を決めるメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //PickerViewのコンポーネント内の行数を決めるメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfPeople.count
    }
    
    //PickerViewのコンポーネントに表示するデータを決めるメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        //配列の値を文字列に変換してPickerのtitleに使う
        return String(numberOfPeople[row]) + "人"
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int,inComponent component: Int) {
        people = numberOfPeople[row]
    }
    
    
    //値を送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendNumberOfPeople"{
            let inputNameViewController = segue.destination as! inputNameViewController
            inputNameViewController.people = self.people
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
