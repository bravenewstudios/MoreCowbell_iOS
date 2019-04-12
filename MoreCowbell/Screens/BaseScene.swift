//
//  BaseScene.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-12.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class BaseScene: SKScene {
    
    var gameInstance:GameInstance!
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    func SetGameInstance(inst:GameInstance) {
        gameInstance = inst
    }
    
    func OnSceneDisplay(){
        // virtual function
    }
}
