//
//  ARViewController.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import UIKit
import ARKit

protocol AddNodeHandler : class {
    
    func createNode(position : SCNVector3)
}

class ARViewController: UIViewController,ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var allTouchLoc : [CGPoint] = []
    lazy var nodeViewModel = NodeLocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Set the view's delegate
        sceneView.delegate = self
        nodeViewModel.delegate = self
        
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        calculateWorldPosition()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateWorldPosition(){
        if  allTouchLoc.count > 0  {
            
            let projectedOrigin = sceneView.projectPoint(SCNVector3Zero)
            
            for each in allTouchLoc {
                
                let position = SCNVector3Make(Float(each.x), Float(each.y), projectedOrigin.z)
                let worldPoint = sceneView.unprojectPoint(position)
                print("worldPoint \(worldPoint)")
                
                //save location to viewmodel
                nodeViewModel.saveLocations(worldPoint: worldPoint)
            }
            
            
        }
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("ARKIT failed")
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("session was interrupted")
    }
    
}



extension ARViewController : AddNodeHandler {
    
    func createNode(position : SCNVector3){
        print("jelly pos \(position)")
        if let jellyFishScene = SCNScene(named: "art.scnassets/Jellyfish.scn") {
            
            if let jellyFishNode = jellyFishScene.rootNode.childNode(withName: "Jelly", recursively: false) {
                
                let constraint = SCNLookAtConstraint(target: sceneView.pointOfView)
                
                jellyFishNode.constraints = [constraint]
                
                jellyFishNode.position = position
                sceneView.scene.rootNode.addChildNode(jellyFishNode)
            }
        }
    }
}
