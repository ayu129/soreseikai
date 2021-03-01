//
//  inputAnswerViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import UIKit

class inputAnswerViewController: UIViewController, UITextFieldDelegate {
    
    var people: Int!
    var name: [String]!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    
    var answer: [String] = []
    var index: Int = 1
    
    var alphabetId: Int!
    var odaiId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addAnswerToArray()
        answerTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addAnswerToArray(){
        nameLabel.text = name[index - 1] + "さん、解答を入力してください"
        answerTextField.text = ""
    }
    
    @IBAction func addAnswer(){
        index = index + 1
        answer.append(answerTextField.text ?? "無回答")
        if answer.count == people{
            performSegueToPresent()
        }else{
            addAnswerToArray()
        }
    }
    
    func performSegueToPresent(){
        performSegue(withIdentifier: "toPresent", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPresent"{
            let presentViewController = segue.destination as! presentViewController
            presentViewController.people = self.people
            presentViewController.name = self.name
            presentViewController.answer = self.answer
            presentViewController.alphabetId = self.alphabetId
            presentViewController.odaiId = self.odaiId
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
