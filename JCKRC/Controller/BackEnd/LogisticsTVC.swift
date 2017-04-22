
import UIKit

class LogisticsTVC: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}


extension LogisticsTVC {
  
  static func get() -> LogisticsTVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let LogisticsTVC: LogisticsTVC = sb.instantiateViewController()
    return LogisticsTVC
  }
  
}
