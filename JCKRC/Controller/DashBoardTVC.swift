
import UIKit

class DashBoardTVC: UITableViewController {
  
  enum Dashboard: Int {
    case sales, training, backEnd
    
    static var all: [Dashboard] = [.sales, .training, .backEnd]
    
    func title() -> String {
      var title = ""
      
      switch self {
      case .sales: title = "Sales"
      case .training: title = "Training"
      case .backEnd: title = "BackEnd"
      }
      
      return title
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nibName = String(describing: optionTableViewCell.self)
    tableView.register(UINib(nibName: nibName, bundle: nil) , forCellReuseIdentifier: nibName)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Dashboard.all.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: optionTableViewCell.self)) as? optionTableViewCell,
      let dashBoardItem = Dashboard(rawValue: indexPath.row)
      else { return UITableViewCell() }
    cell.titleLabel.text = dashBoardItem.title()
    cell.optionImageView.isHidden = true
    return cell
  }

}
