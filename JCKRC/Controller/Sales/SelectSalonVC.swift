

import UIKit

class SelectSalonVC: UIViewController {
  
  @IBOutlet var cityView: UIView!
  @IBOutlet var cityNameLabel: UILabel!
  @IBOutlet var mapView: UIView!
  @IBOutlet var selectSaloonView: UIView!
  @IBOutlet var saloonNameLabel: UILabel!
  
  var selectCityEnabled = false

  override func viewDidLoad() {
    super.viewDidLoad()
    
    cityView.layer.cornerRadius = 5
    let gesture = UITapGestureRecognizer(target: self, action: #selector(segueToCityList))
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(segueToSaloonList))
    cityView.addGestureRecognizer(gesture)
    selectSaloonView.addGestureRecognizer(tapGesture)
  }
  
  func segueToCityList(sender: UITapGestureRecognizer) {
    selectCityEnabled = true
    let data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    segueToList(with: data, having: "Select City")
  }
  
  func segueToSaloonList() {
    selectCityEnabled = false
    let data = ["a","b","c","Chicago","Los Angeles","Austin","Seattle"]
    segueToList(with: data, having: "Select Saloon")
  }
  
  func segueToList(with data: [String], having title: String) {
    let listTVC = ListTVC.get()
    listTVC.data = data
    listTVC.navigationTitle = title
    listTVC.delegate = self
    navigationController?.pushViewController(listTVC, animated: true)
  }

}

extension SelectSalonVC: ListTVCDelegate {

  func didSelectItem(value: String) {
    if selectCityEnabled {
      selectCityEnabled = false
      cityNameLabel.text = value
    } else {
      saloonNameLabel.text = value
    }
  }
  
}

extension SelectSalonVC {

  static func get() -> SelectSalonVC {
    let sb = UIStoryboard.init(storyboard: .sales)
    let selectSalonVC: SelectSalonVC = sb.instantiateViewController()
    return selectSalonVC
  }

}
