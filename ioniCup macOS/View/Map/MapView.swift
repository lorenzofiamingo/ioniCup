//
//  MapView.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import SwiftUI
import MapKit

struct MapView: NSViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    
    var teamCity: String = "Locri"
    
    var teamName: String = "Eutimo"
    
    func makeNSView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateNSView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude + 1.5, longitude: coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: span)
        let annotation = MKPointAnnotation()
        annotation.title = teamName
        annotation.subtitle = teamCity
        annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        view.addAnnotation(annotation)
        view.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 20, longitude: 20))
    }
}
