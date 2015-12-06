//
//  GameViewController.swift
//  Basics
//
//  Created by DPayne on 12/1/15.
//  Copyright (c) 2015 Sanctuary of Darkness. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var sceneView: SCNView? // This is an optional so does not require a value
    var scene = GameScene(create: true)
    
    var tapReverse = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = self.view as? SCNView
        
        if let view = sceneView {
            view.scene = scene
            view.showsStatistics = true
            view.backgroundColor = UIColor.blackColor()
            view.antialiasingMode = SCNAntialiasingMode.Multisampling4X
            
            let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
            view.addGestureRecognizer(panGesture)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
            view.addGestureRecognizer(tapGesture)
        }
        
    }
    
    func handlePan(gesture: UIPanGestureRecognizer){
        let translation = gesture.translationInView(sceneView!).x
        
        let xTranslation = Float(translation / view.frame.width)
        if gesture.state == UIGestureRecognizerState.Began ||
            gesture.state == UIGestureRecognizerState.Changed {
                scene.geometryNodes.slide(xTranslation)
        } else if gesture.state == UIGestureRecognizerState.Ended {
            if translation > 100 {
                scene.geometryNodes.realign("RIGHT")
            } else if translation < -100 {
                scene.geometryNodes.realign("LEFT")
            } else {
                scene.geometryNodes.realign("STAY")
            }
        }
    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        if gesture.state == .Ended {
            tapReverse = !tapReverse
            scene.cameraNode.camera!.usesOrthographicProjection = tapReverse
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.AllButUpsideDown
        } else {
            return UIInterfaceOrientationMask.All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
