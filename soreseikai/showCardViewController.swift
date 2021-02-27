//
//  showCardViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import UIKit

class showCardViewController: UIViewController {
    
    var people: Int!
    var name = [String]()
    var answer = [String]()
    
    var answerLabel: [UILabel] = []
    
    let centerWidth = UIScreen.main.bounds.size.width / 2
    let centerHeight = UIScreen.main.bounds.size.height / 2
    
    let r = UIScreen.main.bounds.size.width / 2.5
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< people{
            let card = UILabel()
            let angle = CGFloat.pi / 180.0  * ((360 / CGFloat(people)) * CGFloat(i))
            - CGFloat.pi / 180.0 * 90.0
            let x = r * cos(CGFloat(angle)) + centerWidth - 60
            let y = r * sin(CGFloat(angle)) + centerHeight - 30
            card.frame = CGRect(x: x,y: y,width: 120,height: 60)
            card.text = answer[i]
            card.font = UIFont.systemFont(ofSize: 20.0)
            card.textAlignment = NSTextAlignment.center
            card.adjustsFontSizeToFitWidth = true
            card.backgroundColor = UIColor.red
            answerLabel.append(card)
        }
        
        for card in answerLabel{
            view.addSubview(card)
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
