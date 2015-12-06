//
//  GameScene.swift
//  
//
//  Created by DPayne on 12/2/15.
//
//

import UIKit
import QuartzCore
import SceneKit


class GameScene: SCNScene {
    
    var geometryNodes = GeometryNodes()
    let cameraNode = SCNNode()
    
    convenience init(create: Bool){
        self.init()
        
        geometryNodes.addNodesTo(rootNode)
        
        let floor = SCNFloor()
        floor.firstMaterial!.diffuse.contents = UIColor.whiteColor()
        floor.firstMaterial!.specular.contents = UIColor.whiteColor()
        floor.firstMaterial!.reflective.contents = UIColor.blackColor()
        
        let floorNode = SCNNode(geometry: floor)
        rootNode.addChildNode(floorNode)

        

        cameraNode.camera = SCNCamera()
//        cameraNode.camera!.usesOrthographicProjection = true
        cameraNode.position = SCNVector3(x: 0, y: 1, z: 2)
        cameraNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: Float(-M_PI / 16.0))
        
        
        self.rootNode.addChildNode(cameraNode)
        
        let lightNodeSpot = SCNNode()
        lightNodeSpot.light = SCNLight()
        lightNodeSpot.light!.type = SCNLightTypeSpot
        lightNodeSpot.light!.attenuationStartDistance = 0
        lightNodeSpot.light!.attenuationFalloffExponent = 2
        lightNodeSpot.light!.attenuationEndDistance = 30
        lightNodeSpot.position = SCNVector3(0,3,2)
        
        rootNode.addChildNode(lightNodeSpot)
        
        let emptyTarget = SCNNode()
        emptyTarget.position = SCNVector3(0,0,0)
        
        lightNodeSpot.constraints = [SCNLookAtConstraint(target: emptyTarget)]

        
        
        
    }
   
}
