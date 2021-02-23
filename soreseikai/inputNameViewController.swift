//
//  inputNameViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/23.
//

import UIKit

class inputNameViewController: UIViewController {
    
    var people: Int!
    var name: [String] = []
    var index: Int = 1
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNameToArray()
    }
    
    func addNameToArray(){
        numberLabel.text = String(index) + "人目の名前を入力してください"
        nameTextField.text = ""
    }
    
    @IBAction func addName(){
        index = index + 1
        name.append(nameTextField.text ?? "名無し")
        print(name)
        if name.count == people{
            performSegueToFourth()
        }else{
            addNameToArray()
        }
    }
    
    
    
    //画面遷移
    func performSegueToFourth(){
        performSegue(withIdentifier: "completeName", sender: nil)
    }
    
    //値を送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completeName"{
            let fourthViewController = segue.destination as! fourthViewController
            fourthViewController.people = self.people
            fourthViewController.name = self.name
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
