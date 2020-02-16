//
//  ViewController.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/16/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces


    
var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    var buildings: [Building] = []
    var bath1 : Building!
    var bath2 : Building!
    var bath3 : Building!
    var didFindMyLocation = false
    var table: UIBarButtonItem!

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
      var currentLocation: CLLocation?
      var mapView: GMSMapView!
      var placesClient: GMSPlacesClient!
      var zoomLevel: Float = 15.0
    
    var pushNavViewControllerButton: UIButton!

      // A default location to use when location permission is not granted.
      let defaultLocation = CLLocation(latitude:  42.44851, longitude:  -76.47862)
    
      override func viewDidLoad() {
        
          
           self.navigationItem.title = "Late Night Emergency"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Table", style: .plain, target: self, action: #selector(pushNavViewController))
 
          let bd1 = Building(name: "Random", id: 9, lat: 42.4482392539, long: -76.4819027445, hours: "", bathrooms: [], vending: [])
        
        let bath : Bathroom = Bathroom(building: bd1, location: "Somewhere", floor: "Floor 2", rating: 3.7, reviews: [])
        
        bath2 = Building(name: "A.D. White House", id: 0, lat: 42.4482392539, long: -76.4819027445, hours: "", bathrooms: [bath], vending: [])
        bath1 = Building(name: "Olin Hall", id: 1, lat: 42.4456177149, long: -76.4844945113, hours: "", bathrooms: [bath], vending: [])
        bath3 = Building(name: "ARTHROPOD RESEARCH FACILITY", id: 2, lat: 42.4442592708, long: -76.4517696033, hours: "", bathrooms: [bath], vending: [])
        
        
       let bath4 = Building(name: "CARPENTER HALL", id: 3, lat: 42.4447603073, long: -76.4841356088, hours: "", bathrooms: [bath], vending: [])

       let bath5 = Building(name: "William Keeton House", id: 4, lat: 42.44656098407834, long: -76.48944980957032, hours: "", bathrooms: [bath], vending: [])
        
        let bath6 = Building(name: "HANS BETHE HOUSE", id: 5, lat: 42.4470362225, long: -76.488588406, hours: "", bathrooms: [bath], vending: [])

        let bath7 = Building(name: "URIS HALL", id: 6, lat: 42.447205031, long: -76.4821972478, hours: "", bathrooms: [bath], vending: [])
        
        let bath8 = Building(name: "OLIN LIBRARY", id: 7, lat: 42.4478464335, long: -76.4842355183, hours: "", bathrooms: [bath], vending: [])

        let bath9 = Building(name: "KLARMAN HALL", id: 8, lat: 42.4491084147, long: -76.4831412175, hours: "", bathrooms: [bath], vending: [])
         
       let bath10 = Building(name: "KIMBALL HALL", id: 9, lat: 42.4439365321, long: -76.483236183, hours: "", bathrooms: [bath], vending: [])
        
        let bath11 = Building(name: "BARTON HALL", id: 10, lat: 42.4459517966, long: -76.4807258636, hours: "", bathrooms: [bath], vending: [])
        
        let bath12 = Building(name: "Alice H. Cook House", id: 11, lat: 42.4488900897, long: -76.4896596549, hours: "", bathrooms: [bath], vending: [])

        
        let bath13 = Building(name: "LINCOLN HALL", id: 12, lat: 42.4501792762, long: -76.4834945682, hours: "", bathrooms: [bath], vending: [])
         
         let bath14 = Building(name: "MCGRAW HALL", id: 13, lat: 42.4494454008, long:  -76.4853706399, hours: "", bathrooms: [bath], vending: [])
         
         let bath15 = Building(name: "NOYES COMMUNITY AND REC CENTER", id: 14, lat:  42.4464662289, long: -76.4880340365, hours: "", bathrooms: [bath], vending: [])

         
        
        let bath16 = Building(name: "PHILLIPS HALL", id: 15, lat: 42.444569445, long: -76.482090336, hours: "", bathrooms: [bath], vending: [])
         
         let bath17 = Building(name: "PHYSICAL SCIENCES BUILDING", id: 16, lat: 42.4498536215, long:  -76.4817090099, hours: "", bathrooms: [bath], vending: [])
         
         let bath18 = Building(name: "ROCKEFELLER HALL", id: 17, lat:42.4491064556, long: -76.4818194601, hours: "", bathrooms: [bath], vending: [])

         
        
        
        
        buildings = [bath1,bath2,bath3,bath4,bath5,bath6,bath7,bath8,bath9,bath10,bath11,bath12,
        bath13,bath14,bath15,bath16,bath17,bath18]
        
        
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                                     longitude: defaultLocation.coordinate.longitude,
                                                      zoom: zoomLevel)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    

        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        view = mapView
//        let color1 = UIColor(red: 246.0/255.0, green: 62.0/255.0, blue: 2.0/255.0, alpha: 1.0)
//        let color2 = UIColor(red: 255.0/255.0, green: 98.0/255.0, blue: 1.0/255.0, alpha: 1.0)
        let barcol = UIColor(red: 238.0/255.0, green: 150.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        
        navigationController?.navigationBar.barTintColor = barcol
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 212.0/255.0, alpha: 1.0)]
        
         //   CGFloat(integerLiteral: 246.0), green: CGFloat(integerLiteral: 62.0), blue: CGFloat(integerLiteral: 2.0), alpha: 255)
        
        
        mapView.delegate = self
        for room in buildings {
            let position = CLLocationCoordinate2D(latitude: room.lat, longitude: room.long)
            let marker = GMSMarker(position: position)
            marker.title = room.name
            marker.map = mapView
            marker.snippet = "Bathroom: Click me"
            marker.tracksInfoWindowChanges = true
            marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        }
        
      }
    @objc func pushNavViewController() {
        let newViewController = TableViewController(bathrooms: buildings)
        self.navigationController?.pushViewController(newViewController, animated: true)
        //present(viewController, animated: true, completion: nil)
    }
}
func updateBathrooms() {
      
    for room in buildings {
        let position = CLLocationCoordinate2D(latitude: room.lat, longitude: room.long)
        let marker = GMSMarker(position: position)
        marker.title = room.name
        marker.map = mapView
        

    }
    
    
 
       }


      //Location Manager delegates
func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            mapView.isMyLocationEnabled = true
        }
    }

extension ViewController: GMSMapViewDelegate {
    //class code

//    @objc(mapView:didTapMarker:) func mapView(_: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        print("You tapped at \(marker.position.latitude), \(marker.position.longitude)")
//        return true
//    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("infowindow tapped")
        buildings.sort { $0.id < $1.id }
        let id = getid(buildings: buildings, name: marker.title!)
        let newViewController = BuildingPageViewController(building: buildings[id])
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

//
//      // Handle authorization for the location manager.
//      func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .restricted:
//          print("Location access was restricted.")
//        case .denied:
//          print("User denied access to location.")
//          // Display the map using the default location.
//          mapView.isHidden = false
//        case .notDetermined:
//          print("Location status not determined.")
//        case .authorizedAlways: fallthrough
//        case .authorizedWhenInUse:
//          print("Location status is OK.")
//        @unknown default:
//            print("Fatal error")
//        }
//      }
//
//      // Handle location manager errors.
//      func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        locationManager.stopUpdatingLocation()
//        print("Error: \(error)")
//      }
//    }
func getid(buildings: [Building],name: String) -> Int {
    for room in buildings {
        if room.name == name {
            return room.id
        }
    }
    return 0
}
