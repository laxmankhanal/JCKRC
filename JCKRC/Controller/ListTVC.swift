
import UIKit

protocol ListTVCDelegate: class {
  
  func didSelectItem(value: String)

}

class ListTVC: UITableViewController {
  
  var searchActive : Bool = false
  var data: [String] = []
  var navigationTitle = ""
  var filtered:[String] = []
  
  weak var delegate: ListTVCDelegate?
  
  @IBOutlet var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    navigationItem.title = navigationTitle
    searchBar.delegate = self
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchActive {
      return filtered.count
    }
    
    return data.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) 
    
    if searchActive {
      cell.textLabel?.text = filtered[indexPath.row]
    } else {
      cell.textLabel?.text = data[indexPath.row];
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var item = ""
    
    if searchActive {
      item = filtered[indexPath.row]
    } else {
      item = data[indexPath.row];
    }
    
    delegate?.didSelectItem(value: item)
    self.navigationController?.popViewController(animated: true)
  }
  
}

extension ListTVC: UISearchBarDelegate {
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchActive = true;
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchActive = false;
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    filtered = data.filter({ text -> Bool in
      return text.lowercased().contains(searchText.lowercased())
    })
    
    if(filtered.count == 0){
      searchActive = false;
    } else {
      searchActive = true;
    }
    self.tableView.reloadData()
  }
  
}

extension ListTVC {
  
  static func get() -> ListTVC {
    let sb = UIStoryboard.init(storyboard: .sales)
    let listTVC: ListTVC = sb.instantiateViewController()
    return listTVC
  }

}
