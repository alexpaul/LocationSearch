//
//  ViewController.swift
//  LocationSearch
//
//  Created by Alex Paul on 10/9/17.
//  Copyright © 2017 Alex Paul. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var currentPoint: CGPoint!
    var currentCoordinate: CLLocationCoordinate2D!
    var longPress: UILongPressGestureRecognizer!
    var annotation: MKPointAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        annotation = MKPointAnnotation()
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(locationChanged))
        mapView.addGestureRecognizer(longPress)
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        locationLabel.textAlignment = .center
    }
    
    @objc func locationChanged(_ gesture: UILongPressGestureRecognizer) {
        currentPoint = gesture.location(in: mapView)
        currentCoordinate = mapView.convert(currentPoint, toCoordinateFrom: mapView)
        print(currentCoordinate)
        annotation.coordinate = currentCoordinate
        mapView.removeAnnotation(annotation)
        mapView.addAnnotation(annotation)
        locationLabel.text = "\(currentCoordinate.latitude), \(currentCoordinate.longitude)"    
    }
}


