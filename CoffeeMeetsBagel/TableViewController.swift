//
//  TableViewController.swift
//  CoffeeMeetsBagel
//
//  Created by Luke Solomon on 3/22/17.
//  Copyright © 2017 Luke Solomon. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UIViewController {
    
    var elements: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let path = Bundle.main.path(forResource: "People", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let people : [NSDictionary] = jsonResult["person"] as? [NSDictionary] {
                        for person: NSDictionary in people {
                            for (name,value) in person {
                                print("\(name) , \(value)")
                                elements.append(value as! String)
                                
                                tableView.reloadData()
                            }
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
    
    
    
}
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        
        cell.textLabel?.text = elements[indexPath.row]
        
        return cell
    }

    
}
