//
//  GeometryNodes.swift
//  Basics
//
//  Created by DPayne on 12/4/15.
//  Copyright © 2015 Sanctuary of Darkness. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit


class GeometryNodes{
    let cube = CustomSCNNode(geometry: SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0), inititalPosition: SCNVector3(0,0.5,0))
    let sphere = CustomSCNNode(geometry: SCNSphere(radius: 0.25), inititalPosition: SCNVector3(-2,0.5,0))
    let pyramid = CustomSCNNode(geometry: SCNPyramid(width: 0.5, height: 0.5, length: 0.5), inititalPosition: SCNVector3(2,0.25,0))
    
    let defaultMaterial = SCNMaterial()
    init(){
        defaultMaterial.diffuse.contents = UIColor.whiteColor()
        defaultMaterial.specular.contents = UIColor.blackColor()
        defaultMaterial.emission.contents = UIColor.grayColor()
        
        cube.geometry!.firstMaterial = defaultMaterial
        sphere.geometry!.firstMaterial = defaultMaterial
        pyramid.geometry!.firstMaterial = defaultMaterial
        
    }
    
    func addNodesTo (parentNode: SCNNode){
        parentNode.addChildNode(cube)
        parentNode.addChildNode(sphere)
        parentNode.addChildNode(pyramid)


    }
    
    func slideFunction(node:CustomSCNNode, translation: Float){
        node.position.x = node.positionToSlideFrom.x + translation
    }
    
    func slide(xTranslation: Float){
        slideFunction(cube, translation: xTranslation)
        slideFunction(sphere, translation: xTranslation)
        slideFunction(pyramid, translation: xTranslation)

    }
    
    func realignFunction(node: CustomSCNNode, direction: String){
        var animationTime = 0.3
        if direction == "LEFT" {
            node.positionToSlideFrom.x -= 2.0
        } else if direction == "RIGHT" {
            node.positionToSlideFrom.x += 2.0
        }
        
        if node.positionToSlideFrom.x > 2.0 {
            node.positionToSlideFrom.x  = -2.0
            animationTime = 0
        } else if node.positionToSlideFrom.x < -2.0 {
            node.positionToSlideFrom.x = 2.0
            animationTime = 0
        }
        
        let move =  SCNAction.moveTo(node.positionToSlideFrom, duration: animationTime)
        move.timingMode = SCNActionTimingMode.EaseInEaseOut
        node.runAction(move)
    }
    
    func realign(direction: String){
        realignFunction(cube, direction: direction)
        realignFunction(sphere, direction: direction)
        realignFunction(pyramid, direction: direction)

    }
}