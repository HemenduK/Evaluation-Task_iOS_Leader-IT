//
//  MapVC.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 28/10/21.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var coords = CLLocation()
    var latitude : String?
    var longitude : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        if let lat = self.latitude, let long = self.longitude{
            self.coords = CLLocation(latitude: Double(lat)!, longitude: Double(long)!);
            self.addAnnotations(coord: self.coords)
        }
        
    }
    
    func addAnnotations(coord: CLLocation){
        let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                  longitude: coord.coordinate.longitude);
        let anno = MKPointAnnotation();
        anno.coordinate = CLLCoordType;
        mapView.addAnnotation(anno);
        mapView.centerCoordinate = coord.coordinate
    }
}

