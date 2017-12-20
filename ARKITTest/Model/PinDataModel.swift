//
//  PinDataModel.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import Foundation
import MapKit

class PinDataModel : NSObject, MKAnnotation {
    
    var title : String?
    var coordinate: CLLocationCoordinate2D
    
    
    init (title: String, coordinate : CLLocationCoordinate2D ) {
        
        self.title = title
        self.coordinate = coordinate
        super.init()
        
    }
}
