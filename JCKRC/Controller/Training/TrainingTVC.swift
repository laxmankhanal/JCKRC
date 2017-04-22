
import UIKit

class TrainingTVC: UITableViewController {
  
  enum TrainingItem: Int {
    case selectSalon, newSalon, selfAvailability, viewAvailability, bookTraining, bookOrder, logout
    
    static var all: [TrainingItem] = [.selectSalon, .newSalon, .selfAvailability, .viewAvailability, .bookTraining, .bookOrder, .logout]
    
    func title() -> String {
      var title = ""
      
      switch self {
      case .selectSalon: title = "SALON SELECT"
      case .newSalon: title = "NEW SALON"
      case .selfAvailability: title = "SELF AVAILABILITY"
      case .viewAvailability: title = "VIEW AVAILABILITY"
      case .bookTraining: title = "BOOK A TRAINING"
      case .bookOrder: title = "BOOK AN ORDER"
      case .logout: title = "LOGOUT"
      }
      
      return title
    }
    
    func image() -> UIImage {
      var imageName = ""
      
      switch self {
      case .selectSalon, .newSalon, .selfAvailability, .bookOrder, .viewAvailability, .bookTraining: imageName = "right_arrow"
      case .logout: imageName = "logout"
      }
      
      return UIImage(named: imageName)!
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.contentInset.top = 40
    
    navigationItem.title = "Training"
    
    let nibName = String(describing: optionTableViewCell.self)
    tableView.register(UINib(nibName: nibName, bundle: nil) , forCellReuseIdentifier: nibName)
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TrainingItem.all.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: optionTableViewCell.self), for: indexPath) as? optionTableViewCell,
      let salesItem = TrainingItem(rawValue: indexPath.row) else { return UITableViewCell() }
    cell.titleLabel.text = salesItem.title()
    cell.optionImageView.image = salesItem.image()
    tableView.layoutSubviews()
    return cell
  }
  
}

extension TrainingTVC {
  
  static func get() -> TrainingTVC {
    let sb = UIStoryboard.init(storyboard: .main)
    let trainingTVC: TrainingTVC = sb.instantiateViewController()
    return trainingTVC
  }
  
}
