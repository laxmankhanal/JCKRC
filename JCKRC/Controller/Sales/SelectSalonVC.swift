

import UIKit

class SelectSalonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SelectSalonVC {

  static func get() -> SelectSalonVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let SelectSalonVC: SelectSalonVC = sb.instantiateViewController()
    return SelectSalonVC
  }

}
