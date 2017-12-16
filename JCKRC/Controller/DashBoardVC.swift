
import UIKit

class DashBoardVC: UIViewController {
  
  var navController: UINavigationController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navController = UINavigationController(rootViewController: DashBoardVC.get())
  }
  
  @IBAction func salesButtonAction(_ sender: UIButton) {
    segueToSalesTVC()
  }
  @IBAction func trainingButtonAction(_ sender: UIButton) {
    segueToTrainingTVC()
  }
  @IBAction func backEndButtonAction(_ sender: UIButton) {
    segueToBackEndTVC()
  }
  
  func segueToSalesTVC() {
    let salesTVC = SalesTVC.get()
    let navigationController = UINavigationController(rootViewController: salesTVC)
    present(navigationController, animated: true, completion: nil)
  }
  
  func segueToTrainingTVC() {
    let trainingTVC = TrainingTVC.get()
//    let navigationController = UINavigationController(rootViewController: self)
    
//    navController?.pushViewController(trainingTVC, animated: true)
    present(navController!, animated: true, completion: nil)
  }
  
  func segueToBackEndTVC() {
    let backEndVC = BackEndVC.get()
    let navigationController = UINavigationController(rootViewController: backEndVC)
    present(navigationController, animated: true, completion: nil)
  }

}

extension DashBoardVC {
  
  static func get() -> DashBoardVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let dashBoardVC: DashBoardVC = sb.instantiateViewController()
    return dashBoardVC
  }

}
