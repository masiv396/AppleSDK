//
//  LocationService.swift
//  AppleClientMasivian
//
//  Created by Masiv on 15/09/21.
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate{
    
    var country = "Unknown"
    var manager: CLLocationManager?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else{return}
        let location = CLLocation(latitude: first.coordinate.latitude, longitude: first.coordinate.longitude)
        location.geocode { placemark, error in
            if (error as? CLError) != nil {
                return
            } else if let placemark = placemark?.first {
                DispatchQueue.main.async {
                    self.country = placemark.isoCountryCode ?? "Unknown"
                }
            }
        }
    }
    
    func getLocation() {
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
}

extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}
