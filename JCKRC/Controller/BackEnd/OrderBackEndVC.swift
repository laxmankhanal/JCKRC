
import UIKit

class OrderBackEndVC: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension OrderBackEndVC {
  
  static func get() -> OrderBackEndVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let OrderBackEndVC: OrderBackEndVC = sb.instantiateViewController()
    return OrderBackEndVC
  }
  
}

