import UIKit
import HealthKit

enum TabBarItem {
  
  case sales, training, backEnd
  
  static let all: [TabBarItem] = [.sales, .training, .backEnd]
  
  func title() -> String {
    var title = ""
    
    switch self {
    case .sales: title = "Sales"
    case .training: title = "Training"
    case .backEnd: title = "Back End"
    }
    
    return title
  }
  
  func imageName() -> String {
    var name = ""
    
    switch self {
    case .sales: name = "Sales"
    case .training: name = "Training"
    case .backEnd: name = "Back End"
    }
    
    return name
  }
  
  func viewController() -> UIViewController {
    var viewController = UIViewController()
    
    switch self {
    case .sales: viewController = SalesTVC.get()
    case .training: viewController = TrainingTVC.get()
    case .backEnd: viewController = BackEndVC.get()
    }
    
    return viewController
  }
  
}

class TabBarController: UITabBarController {
  
  var indexOfVCToSelect: Int = 0
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.viewControllers = getViewControllers()
  }
  
  private func getViewControllers() -> [UINavigationController] {
    var navigationControllers = [UINavigationController]()
    for item in TabBarItem.all {
      navigationControllers.append(navigationController(for: item))
    }
    
    return navigationControllers
  }
  
  func navigationController(for item: TabBarItem) -> UINavigationController {
    let tabBarImage = UIImage(named: item.imageName())
    let nc = UINavigationController(rootViewController: item.viewController())
    nc.navigationBar.topItem?.title = item.title()
    nc.tabBarItem = UITabBarItem(title: item.title(), image: tabBarImage, selectedImage: tabBarImage)
    
    return nc
  }

}

extension TabBarController {
  
  static func get() -> TabBarController {
    let sb = UIStoryboard.init(storyboard: .tabBar)
    let tabBarController: TabBarController = sb.instantiateViewController()
    return tabBarController
  }
  
}
