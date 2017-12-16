
import UIKit

class SalesTVC: UITableViewController {
  
  enum SalesItem: Int {
    case selectSalon, newSalon, analysis, training, availaibility, book, logout
    
    static var all: [SalesItem] = [.selectSalon, .newSalon, .analysis, .training, .availaibility, .book, .logout]
    
    func title() -> String {
      var title = ""
      
      switch self {
      case .selectSalon: title = "SALON SELECT"
      case .newSalon: title = "NEW SALON"
      case .analysis: title = "ANALYSIS"
      case .training: title = "BOOK A TRAINING"
      case .availaibility: title = "VIEW AVAILAIBILITY"
      case .book: title = "BOOK AN ORDER"
      case .logout: title = "LOGOUT"
      }
      
      return title
    }
    
    func image() -> UIImage {
      var imageName = ""
      
      switch self {
      case .selectSalon, .newSalon, .analysis, .training, .availaibility, .book: imageName = "right_arrow"
      case .logout: imageName = "logout"
      }
      
      return UIImage(named: imageName)!
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.contentInset.top = 40
    
    navigationItem.title = "Sales"
    
    let nibName = String(describing: optionTableViewCell.self)
    tableView.register(UINib(nibName: nibName, bundle: nil) , forCellReuseIdentifier: nibName)
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SalesItem.all.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: optionTableViewCell.self), for: indexPath) as? optionTableViewCell,
      let salesItem = SalesItem(rawValue: indexPath.row) else { return UITableViewCell() }
    cell.titleLabel.text = salesItem.title()
    cell.optionImageView.image = salesItem.image()
    tableView.layoutSubviews()
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let salesItem = SalesItem(rawValue: indexPath.row) else { return }
    
    switch salesItem {
    case .selectSalon: segueToVC(viewController: SelectSalonVC.get())
    case .newSalon: segueToVC(viewController: NewSalonVC.get())
    case .analysis: segueToVC(viewController: AnalysisVC.get())
    case .training: segueToVC(viewController: TrainingTVC.get())
    case .availaibility: segueToVC(viewController: ViewAvailibilityVC.get())
    case .book: segueToVC(viewController: BookOrderTVC.get())
    case .logout: segueToVC(viewController: SelectSalonVC.get())
    }
  }
  
  func segueToVC(viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}

extension SalesTVC {
  
  static func get() -> SalesTVC {
    let sb = UIStoryboard.init(storyboard: .sales)
    let salesTVC: SalesTVC = sb.instantiateViewController()
    return salesTVC
  }
  
}
