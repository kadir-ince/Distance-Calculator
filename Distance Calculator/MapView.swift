//
//  MapView.swift
//  Distance Calculator
//
//  Created by Kadir on 23.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinates: CLLocationCoordinate2D
    var mapAnnotations: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setCenter(CLLocationCoordinate2DMake(37.3344728, -122.008715), animated: true)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        if mapAnnotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(mapAnnotations)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var mapViewParent: MapView
        init(_ parent: MapView) {
            self.mapViewParent = parent
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            mapViewParent.centerCoordinates = mapView.centerCoordinate
        }
    }
}

extension MKPointAnnotation {
    static var applePark: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Apple Park"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.3344728, longitude: -122.008715)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinates: .constant(MKPointAnnotation.applePark.coordinate), mapAnnotations: [MKPointAnnotation.applePark])
    }
}
