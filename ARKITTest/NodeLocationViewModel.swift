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
       
            let last = nodeLocations[nodeLocations.count - 1]
        
            guard let posX = last.position?.x , let posY = last.position?.y,
                let posZ = last.position?.z else {
                    return
            }
            
            delegate?.createNode(position: SCNVector3(posX,posY,posZ))
        
    }
}
