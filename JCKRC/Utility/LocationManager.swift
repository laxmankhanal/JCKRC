
import Foundation
import GoogleMaps

struct LocationManager {
  
  static var coordinates: CLLocationCoordinate2D?
  
  static func getCoordinates(for address: String) -> CLLocationCoordinate2D? {
    
    CLGeocoder().geocodeAddressString(address) {
      (placeMakers, error) in
      if error != nil {
        print(error ?? "Geo Coding failed.")
        return
      }
      if (placeMakers?.count)! > 0 {
        let placemark = placeMakers?[0]
        let location = placemark?.location
        let coordinate = location?.coordinate
        print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
        self.coordinates = coordinate
      }
    }
    
    return coordinates
  }

}
