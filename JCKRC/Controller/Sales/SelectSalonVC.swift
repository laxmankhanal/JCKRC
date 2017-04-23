

import UIKit
import GoogleMaps

class SelectSalonVC: UIViewController {
  
  @IBOutlet var cityView: UIView!
  @IBOutlet var cityNameLabel: UILabel!
  @IBOutlet var selectSaloonView: UIView!
  @IBOutlet var saloonNameLabel: UILabel!
  @IBOutlet weak var googleMapView: GMSMapView!
  
  var selectCityEnabled = false
  var locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(segueToCityList))
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(segueToSaloonList))
    cityView.addGestureRecognizer(gesture)
    selectSaloonView.addGestureRecognizer(tapGesture)
    
    googleMapView.delegate = self
    googleMapView.isMyLocationEnabled = true
    
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
//    let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//    let map = GMSMapView.map(withFrame: mapView.bounds, camera: camera)
//    mapView.addSubview(map)
  }
  
  func segueToCityList(sender: UITapGestureRecognizer) {
    selectCityEnabled = true
    let data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    segueToList(with: data, having: "Select City")
  }
  
  func segueToSaloonList() {
    selectCityEnabled = false
    let data = ["A Super Look 9","b","c","Chicago","Los Angeles","Austin","Seattle"]
    segueToList(with: data, having: "Select Saloon")
  }
  
  func segueToList(with data: [String], having title: String) {
    let listTVC = ListTVC.get()
    listTVC.data = data
    listTVC.navigationTitle = title
    listTVC.delegate = self
    navigationController?.pushViewController(listTVC, animated: true)
  }
  
  func animateCamera(to coordinate: CLLocationCoordinate2D) {
    let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude:coordinate.longitude, zoom:14)
    googleMapView.animate(to: camera)
  }

}

extension SelectSalonVC: GMSMapViewDelegate {

}

extension SelectSalonVC: CLLocationManagerDelegate {
  
  //Location Manager delegates
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    guard let location = locations.last else { return }
    
    animateCamera(to: location.coordinate)
    
    //Finally stop updating location otherwise it will come again and again in this delegate
    self.locationManager.stopUpdatingLocation()
    
  }
  
}

extension SelectSalonVC: ListTVCDelegate {

  func didSelectItem(value: String) {
    if selectCityEnabled {
      selectCityEnabled = false
      cityNameLabel.text = value
    } else {
      saloonNameLabel.text = value
      let fullAddress =  "\(cityNameLabel.text!)"
      guard let coordinates = LocationManager.getCoordinates(for: fullAddress) else { return }
      animateCamera(to: coordinates)
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
