
import UIKit

class ViewAvailibilityVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewAvailibilityVC {
  
  static func get() -> ViewAvailibilityVC {
    let sb = UIStoryboard.init(storyboard: .sales)
    let viewAvailibilityVC: ViewAvailibilityVC = sb.instantiateViewController()
    return viewAvailibilityVC
  }
  
}
