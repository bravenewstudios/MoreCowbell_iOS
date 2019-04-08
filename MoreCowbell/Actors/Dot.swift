//
//  Dot.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class Dot:SKSpriteNode {
    
    var movein:SKAction
    var moveout:SKAction
    var fadeout:SKAction
    var fadein:SKAction
    var enter:SKAction
    var exit:SKAction
    var sequence:SKAction
    var bar:SKSpriteNode!
    var startPoint:CGPoint!
    var hit = false
    
    init(Bar: SKSpriteNode, screenHeight: Double){
        let texture = SKTexture(imageNamed: "dot")
        let imgSize = CGSize(width: Bar.size.width * 0.1,height: Bar.size.width * 0.1)
        startPoint.x = Bar.size.width + Bar.size.width / 2
        startPoint.y = CGFloat(screenHeight * 0.5)
        fadein = SKAction.fadeIn(withDuration: 0.2)
        fadeout = SKAction.fadeOut(withDuration: 0.2)
        movein = SKAction.moveTo(x: Bar.position.x + Bar.size.width * 0.07, duration: Conductor.DOTMOVETIME)
        moveout = SKAction.moveTo(x: Bar.position.x - imgSize.width, duration: 0.2 * Conductor.DOTMOVETIME)
        enter = SKAction.group([fadein,movein])
        exit = SKAction.group([fadeout,moveout])
        sequence = SKAction.sequence([enter,exit])
        super.init(texture: texture, color:UIColor.clear, size:bar.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func FireAction() {
        hit = false;
        position = startPoint
//        enter = SKAction.group([fadein, movein])
//        exit = SKAction.group([fadeout, moveout])
//        sequence = SKAction.group([enter,exit])
        run(sequence)
    }
}
