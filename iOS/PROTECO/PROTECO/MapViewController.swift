//
//  MapViewController.swift
//  PROTECO
//
//  Created by Angel Vázquez on 3/7/18.
//  Copyright © 2018 Angel Vázquez. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
	
	var mapView: MKMapView!
	var manager = CLLocationManager()
	
	//	Set initial radius for the map. ~100 meters
	let regionRadius: CLLocationDistance = 300
	
	//MARK: Override default view with MapView
	override func loadView() {
		mapView = MKMapView()
		mapView.delegate = self
		view = mapView
    }
	
    //  Misión, visión, imágenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//	Set PROTECO location.
		let latitude: CLLocationDegrees = 19.3279397
		let longitude: CLLocationDegrees = -99.1821128
		let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
		
		//	Add an annotation for the location of PROTECO
		let annotation = MKPointAnnotation()
		annotation.coordinate = initialLocation.coordinate
		annotation.title = "PROTECO"
		annotation.subtitle = "Q220. Edificio Q 'Luis G. Valdés Vallejo'. Anexo de Ingeniería. Ciudad Universitaria"
		mapView.addAnnotation(annotation)
		
		centerMapOnLocation(location: initialLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: Custom methods
	func centerMapOnLocation(location: CLLocation){
		let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
		mapView.setRegion(coordinateRegion, animated: true)
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
