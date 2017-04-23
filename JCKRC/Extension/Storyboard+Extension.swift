import Foundation
import UIKit

protocol StoryboardIdentifiable {
  
  static var storyboardIdentifier: String { get }
  
}

extension StoryboardIdentifiable where Self: UIViewController {
  
  static var storyboardIdentifier: String {
    print(String(describing: self))
    return String(describing: self)
  }
  
}

extension UIStoryboard {
  
  //The uniform place where we state all the storyboard we have in our application
  
  enum Storyboard: String {
    case main
    case home
    case sales
    case training
    case backend
    case tabBar
    
    var fileName: String {
      return rawValue.lowercased()
    }
  }
  
  convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
    self.init(name: storyboard.fileName, bundle: bundle)
  }
  
  // MARK: - View Controller Instantiation from Generics
  
  func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
    guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
      fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
    }
    
    return viewController
  }
  
}

