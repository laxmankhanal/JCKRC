

import UIKit

class SelfAvailibilityVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}

extension SelfAvailibilityVC {
  
  static func get() -> SelfAvailibilityVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let selfAvailibilityVC: SelfAvailibilityVC = sb.instantiateViewController()
    return selfAvailibilityVC
  }
  
}
