//
//  NodeLocationViewModel.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/21/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import Foundation
import ARKit

class NodeLocationViewModel {
    
    private var nodeLocations : [NodeLocationDataModel]
    weak var delegate : AddNodeHandler?
    
    init(){
        nodeLocations = []
    }
    
    func saveLocations(worldPoint: SCNVector3){
        
        nodeLocations.append(NodeLocationDataModel(position: worldPoint))
        createNodes()
        
    }
    
    func createNodes(){
        print(nodeLocations.count)
        for each in nodeLocations {
            
            guard let posX = each.position?.x , let posY = each.position?.y,
                let posZ = each.position?.z else {
                    return
            }
            
            delegate?.createNode(position: SCNVector3(posX,posY,posZ))
        }
        
    }
}
