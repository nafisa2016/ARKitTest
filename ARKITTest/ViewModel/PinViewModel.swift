//
//  PinViewModel.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import Foundation
import MapKit

class PinViewModel {
    
    private var pin : PinDataModel?
    weak var delegate : AddPinHandler?
    
    var touchLocation : CGPoint?
    
    var allTouchedLocations : [CGPoint] = []
    
    //MARK:- create annotation from location received
    func locationTouched(title : String , coordinate: CLLocationCoordinate2D){
        //save touch location
        if let touchLoc = touchLocation {
            allTouchedLocations.append(touchLoc)
        }
        
        
        //Update mapview
        delegate?.addPin(touchedPt: PinDataModel(title: title, coordinate: coordinate))
        
    }
    
}
