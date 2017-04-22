//
//  AnalysisVC.swift
//  JCKRC
//
//  Created by Pro on 4/23/17.
//  Copyright © 2017 leapfrog-laxman. All rights reserved.
//

import UIKit

class AnalysisVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension AnalysisVC {
  
  static func get() -> AnalysisVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let AnalysisVC: AnalysisVC = sb.instantiateViewController()
    return AnalysisVC
  }
  
}
