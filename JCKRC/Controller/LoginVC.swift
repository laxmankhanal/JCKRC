//
//  LoginViewController.swift
//  JCKRC
//
//  Created by Pro on 4/22/17.
//  Copyright © 2017 leapfrog-laxman. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginVC: UIViewController {
  
  @IBOutlet var userName: UITextField!
  @IBOutlet var password: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  
    userName.text = "111"
    password.text = "111"
   
  }
  
  @IBAction func loginButtonAction(_ sender: UIButton) {
    if userName.text == "111" && password.text == "111" {
      segueToDashBoard()
    } else {
      let mbProgress = MBProgressHUD.showAdded(to: view, animated: true)
      mbProgress.mode = .text
      mbProgress.detailsLabel.text = "Invalid User Name or Password"
      mbProgress.removeFromSuperViewOnHide = true
      mbProgress.margin = 10
      mbProgress.offset = CGPoint(x: 0, y: 210)
      mbProgress.hide(animated: true, afterDelay: 2)
    }
    
  }
  
  func segueToDashBoard() {
    //Initilize tabbar with viewcontrollers.
    let tabBarController = TabBarController.get()
    let window = UIApplication.shared.windows.first
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
    
}

extension LoginVC {

  static func get() -> LoginVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let loginVC: LoginVC = sb.instantiateViewController()
    return loginVC
  }
  
}
