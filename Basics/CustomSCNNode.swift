//
//  CustomSCNNode.swift
//  Basics
//
//  Created by DPayne on 12/4/15.
//  Copyright © 2015 Sanctuary of Darkness. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class CustomSCNNode: SCNNode {
    var positionToSlideFrom = SCNVector3Zero
    
    convenience init(geometry: SCNGeometry, inititalPosition: SCNVector3) {
        self.init()
        self.geometry = geometry
        self.position = inititalPosition
        self.positionToSlideFrom = inititalPosition
    }
    
}
