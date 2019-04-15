//
//  ViewController.swift
//  MapKitAssignment
//
//  Created by Akash Verma on 12/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController
{
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    let countryCode = Locale.current.regionCode
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        checkLocationService()
    }
    
    func setupLocation()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    @IBAction func onShowButtonTap(_ sender: Any)
    {
        if countryCode! == "US"
        {
            let url = URL(string:
                "http://www.newsonair.com/writereaddata/News_Pictures/NAT/2018/Nov/NPIC-201811142185.jpg")
            let task = URLSession.shared.dataTask(with: url!)
            {
                data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async()
                    {
                    let imageN = UIImage(data: data)
                    self.imageView.image = imageN
                }
            }
            task.resume()
        }
    }
    
    func checkLocationService()
    {
        if CLLocationManager.locationServicesEnabled()
        {
            setupLocation()
            checkLocalizationAuthorization()
        }
        else
        {
            //Alert user to turn the notification on.
        }
    }
    
    func centerUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000 , longitudinalMeters: 10000)
            mapKit.setRegion(region, animated: true)
        }
    }
    
    func checkLocalizationAuthorization()
    {
        switch CLLocationManager.authorizationStatus()
        {
        case .authorizedWhenInUse :
            mapKit.showsUserLocation = true
            centerUserLocation()
            return
        case .denied :
            // Show alert how to turn on the location Service
            return
        case .notDetermined :
            locationManager.requestWhenInUseAuthorization()
            return
        case .restricted :
            // Show th alert there is a parent lock
            return
        case .authorizedAlways :
            mapKit.showsUserLocation = true
            return
        }
    }
}

extension ViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{ return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000 , longitudinalMeters: 10000)
        mapKit.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocalizationAuthorization()
    }
}
