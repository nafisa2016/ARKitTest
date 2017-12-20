//
//  ARViewController.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController,ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var touchLoc : CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Set the view's delegate
        sceneView.delegate = self
        
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        if let touchLoc = touchLoc  {
            
            print(touchLoc)
            
            let projectedOrigin = sceneView.projectPoint(SCNVector3Zero)
            
            let position = SCNVector3Make(Float(touchLoc.x), Float(touchLoc.y), projectedOrigin.z)
            let worldPoint = sceneView.unprojectPoint(position)
            print(worldPoint)
            createNode(position: worldPoint)
            
        }
        
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
    
    
    func createNode(position : SCNVector3){
        
        if let jellyFishScene = SCNScene(named: "art.scnassets/Jellyfish.scn") {
            
            if let jellyFishNode = jellyFishScene.rootNode.childNode(withName: "Jelly", recursively: false) {
                
                jellyFishNode.position = position
                sceneView.scene.rootNode.addChildNode(jellyFishNode)
            }
        }
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
