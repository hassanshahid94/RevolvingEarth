//
//  ViewController.swift
//  RevolvingEathARKit
//
//  Created by Hassan on 14.9.2020.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var vwScene: SCNView!
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEarth()
    }
    
    //MARK:- Functions
    func configureEarth()
    {
        let scene = SCNScene()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        cameraNode.position = SCNVector3(x:0, y: 0, z: 5)
        
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)
        
        scene.rootNode.addChildNode(lightNode)
        
        let stars = SCNParticleSystem(named: "art.scnassets/Particles.scnp", inDirectory: nil)!
        scene.rootNode.addParticleSystem(stars)
        
        let earthNode = Earth()
        scene.rootNode.addChildNode(earthNode)
        vwScene.scene = scene
        
        vwScene.showsStatistics = true
        vwScene.backgroundColor = UIColor.black
        vwScene.allowsCameraControl = true
    }
}
