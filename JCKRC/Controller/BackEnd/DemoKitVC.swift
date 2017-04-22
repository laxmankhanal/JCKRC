
import UIKit

class DemoKitVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DemoKitVC {
  
  static func get() -> DemoKitVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let DemoKitVC: DemoKitVC = sb.instantiateViewController()
    return DemoKitVC
  }
  
}
