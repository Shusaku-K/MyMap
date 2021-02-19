//
//  MapView.swift
//  MyMap
//
//  Created by 金城秀作 on 2021/02/13.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKey:String
    
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        print(searchKey)
        
        uiView.mapType = mapType
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKey , completionHandler: {(placemarks,error) in
            
            if let unwrapPlacemarks = placemarks ,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location{
                let targetCoordinate = location.coordinate
                
                print(targetCoordinate)
                
            }
            
            
        })
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー",mapType:  .standard)
    }
}
