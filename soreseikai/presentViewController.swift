//
//  presentViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import UIKit

class presentViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    
    var people: Int!
    var name = [String]()
    var answer = [String]()
    
    @IBOutlet var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.detailTextLabel?.text = name[indexPath.row]
        cell?.textLabel?.text = answer[indexPath.row]
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self

        table.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCard"{
            let showCardViewController = segue.destination as! showCardViewController
            showCardViewController.people = self.people
            showCardViewController.name = self.name
            showCardViewController.answer = self.answer
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
