//
//  DemoTableViewController.swift
//  JCKRC
//
//  Created by Pro on 4/22/17.
//  Copyright © 2017 leapfrog-laxman. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 50
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Heading.all.count
    }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CellTableViewCell
        cell.label.text = Heading(rawValue: indexPath.row)?.title()
        return cell
    }
  
  enum Heading: Int {
    case selectSalon, newSalon, analysis, training, availaibility, book, logout
    
    static var all: [Heading] = [.selectSalon, .newSalon, .analysis, .training, .availaibility, .book, .logout]
    
    func title() -> String {
      switch self {
      case .selectSalon: return "SALON SELECT"
      case .newSalon: return "NEW SALON"
      case .analysis: return "ANALYSIS"
      case .training: return "BOOK A TRAINING"
      case .availaibility: return "VIEW AVAILAIBILITY"
      case .book: return "BOOK AN ORDER"
      case .logout: return "LOGOUT"
      }
    }
  
  
  }

}
