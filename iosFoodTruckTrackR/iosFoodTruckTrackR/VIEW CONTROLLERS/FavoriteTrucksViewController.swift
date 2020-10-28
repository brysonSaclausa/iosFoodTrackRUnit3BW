//
//  FavoriteTrucksViewController.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/17/20.
//

import UIKit
import MapKit
import CoreLocation

class FavoriteTrucksViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()

    let foodtruckController = LoginController()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        //zoomToUserLocation()
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if foodtruckController.token == nil {
            performSegue(withIdentifier: "loginsegue", sender: self)
        }
      
    }
    
    func zoomToUserLocation() {
        let locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest

            // Check for Location Services
            if (CLLocationManager.locationServicesEnabled()) {
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
            }

            //Zoom to user location
            if let userLocation = locationManager.location?.coordinate {
                let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 50, longitudinalMeters: 50)
                mapView.setRegion(viewRegion, animated: false)
            }

            self.locationManager = locationManager

            DispatchQueue.main.async {
                self.locationManager.startUpdatingLocation()
            }
    }


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginVC = segue.destination as? LoginViewController {
            loginVC.foodtruckController = foodtruckController
        }
    }
    

}
