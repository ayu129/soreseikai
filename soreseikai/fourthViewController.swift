//
//  fourthViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/23.
//

import UIKit

class fourthViewController: UIViewController {
    
    var people: Int!
    var name: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    //値を送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOdai"{
            let showOdaiViewController = segue.destination as! showOdaiViewController
            showOdaiViewController.people = self.people
            showOdaiViewController.name = self.name
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
