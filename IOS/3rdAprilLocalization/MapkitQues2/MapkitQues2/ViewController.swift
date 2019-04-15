//
//  ViewController.swift
//  MapkitQues2
//
//  Created by Akash Verma on 12/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import MapKit


final class CustomAnnotation: NSObject , MKAnnotation
{
    var coordinate : CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    var region : MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
      init(coordinate : CLLocationCoordinate2D ,title : String? , subtitle : String?)
      {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
       }
}

class ViewController: UIViewController {
    @IBOutlet weak var mapKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapKit.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let ttnCoordinate = CLLocationCoordinate2D(latitude: 28.5358811, longitude: 77.3457963)
        let ttnAnnotation = CustomAnnotation(coordinate: ttnCoordinate, title: "To The New", subtitle: "Great Place to Work")
        mapKit.addAnnotation(ttnAnnotation)
        mapKit.setRegion(ttnAnnotation.region, animated: true)
        let ttnCircle = MKCircle(center: ttnCoordinate, radius: 30 as CLLocationDistance)
        mapKit.addOverlay(ttnCircle)
        
        let lotusBussParkCoordinate = CLLocationCoordinate2D(latitude: 28.5351020, longitude: 77.3468620)
        let lotusBussParkAnnotation = CustomAnnotation(coordinate: lotusBussParkCoordinate, title: "Lotus Bussiness Park", subtitle: "Have Many More MNCs Like Oracle")
        mapKit.addAnnotation(lotusBussParkAnnotation)
        
        let hclCoordinates = CLLocationCoordinate2D(latitude: 28.5361140, longitude: 77.3437346)
        let hclAnnotation = CustomAnnotation(coordinate: hclCoordinates, title: "HCL", subtitle: "HCL mnc")
        mapKit.addAnnotation(hclAnnotation)
        
        let lotusValleyCoordinates = CLLocationCoordinate2D(latitude: 28.5383552, longitude: 77.3450207)
        let lotusValleyAnnotations = CustomAnnotation(coordinate: lotusValleyCoordinates, title: "Lotus Valley School", subtitle: "One of the Best School")
        mapKit.addAnnotation(lotusValleyAnnotations)
        
        let amityCordinate = CLLocationCoordinate2D(latitude: 28.5441509, longitude: 77.3330171)
        let amityAnnotation = CustomAnnotation(coordinate: amityCordinate, title: "Amity University", subtitle: "For Best Acadmic Growth")
        let amityCircle = MKCircle(center: amityCordinate, radius: 100 as CLLocationDistance)
        let coordinate = [ amityCordinate , ttnCoordinate]
        let startPoint = MKPolyline(coordinates: coordinate, count: coordinate.count)
    
        mapKit.addOverlay(startPoint)
        mapKit.addAnnotation(amityAnnotation)
        mapKit.addOverlay(amityCircle)
    }
}

extension ViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let customAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView
        {
            customAnnotation.animatesWhenAdded = true
            customAnnotation.titleVisibility = .adaptive
            customAnnotation.subtitleVisibility = .adaptive
            customAnnotation.canShowCallout = true
            customAnnotation.rightCalloutAccessoryView = UIButton(type: .infoDark)
            return customAnnotation
        }
        return nil
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let  circle = MKCircleRenderer.init(overlay: overlay)
            circle.strokeColor = UIColor.blue
            circle.lineWidth = 2.5
            //circle.fillColor = UIColor.gray
            return circle
        } else if overlay is MKPolyline {
            let renderer = MKPolylineRenderer.init(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 4.0
            return renderer
        }
        else{
            return MKPolylineRenderer()
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let goToDescription = view.annotation?.title! {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "secondViewController")
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
}
