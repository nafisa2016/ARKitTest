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
    
    //MARK:- create annotation from location received
    func locationTouched(title : String , coordinate: CLLocationCoordinate2D){
        //Update mapview
        delegate?.addPin(touchedPt: PinDataModel(title: title, coordinate: coordinate))
        
    }
}
