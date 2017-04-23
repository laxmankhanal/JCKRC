//
//  LoginViewController.swift
//  JCKRC
//
//  Created by Pro on 4/22/17.
//  Copyright © 2017 leapfrog-laxman. All rights reserved.
//

import UIKit
import MBProgressHUD

class BackEndVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Sales"
  }
  
  @IBAction func demoKitAction(_ sender: UIButton) {
    segueToDemoKit()
  }
  
  @IBAction func ordersAction(_ sender: UIButton) {
    segueToOrderBackEnd()
  }
  
  @IBAction func logisticsAction(_ sender: UIButton) {
    segueToLogistics()
  }
  
  func segueToDemoKit() {
  
  }
  
  func segueToOrderBackEnd() {
  
  }
  
  func segueToLogistics() {
  
  }
  
}


extension BackEndVC {
  
  static func get() -> BackEndVC {
    let sb = UIStoryboard.init(storyboard: .backend)
    let backEndVC: BackEndVC = sb.instantiateViewController()
    return backEndVC
  }
  
}
