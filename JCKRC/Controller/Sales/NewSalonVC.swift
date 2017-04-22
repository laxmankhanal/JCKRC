//
//  NewSalonVC.swift
//  JCKRC
//
//  Created by Pro on 4/23/17.
//  Copyright © 2017 leapfrog-laxman. All rights reserved.
//

import UIKit

class NewSalonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewSalonVC {

  static func get() -> NewSalonVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let NewSalonVC: NewSalonVC = sb.instantiateViewController()
    return NewSalonVC
  }

}
