//
//  SpriteButton.swift
//  SuparSpaceMan
//
//  Created by Admin on 3/24/19.
//  Copyright © 2019 Tech. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteButton: SKNode
{
    private var button:SKSpriteNode
    private var mask:SKSpriteNode
    private var cropNode: SKCropNode
    private var action: () -> Void
    var isEnabled = true
    
    let buttonSound = SKAction.playSoundFileNamed("cowbell.wav", waitForCompletion: false)
    
    init(imageName: String, buttonAction: @escaping () -> Void)
    {
        button = SKSpriteNode(imageNamed: imageName)
        
        mask = SKSpriteNode(color: SKColor.black, size: button.size)
        mask.alpha = 0
        
        cropNode = SKCropNode()
        cropNode.maskNode = button
        cropNode.zPosition = 3
        cropNode.addChild(mask)
        
        action = buttonAction
        
        super.init()
        
        isUserInteractionEnabled = true
        
        SetupNodes()
        AddNodes()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetupNodes()
    {
        button.zPosition = 0
    }
    
    func AddNodes()
    {
        addChild(button)
        addChild(cropNode)
    }
    
    func disable()
    {
        isEnabled = false
        mask.alpha = 0.0
        button.alpha = 0.5
    }
    
    func enable()
    {
        isEnabled = true
        mask.alpha = 0.0
        button.alpha = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if isEnabled {
            mask.alpha = 0.5
            //run(SKAction.scale(by: 1.05, duration: 0.05))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if isEnabled {
            for touch in touches {
                let location: CGPoint = touch.location(in: self)
                
                if button.contains(location) {
                    mask.alpha = 0.5
                    run(buttonSound)
                }
                else {
                    mask.alpha = 0.0
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if isEnabled {
            for touch in touches {
                let location: CGPoint = touch.location(in: self)
                
                if button.contains(location) {
                    disable()
                    action()
                    run(SKAction.sequence([SKAction.wait(forDuration: 0.2), SKAction.run({
                        self.enable()
                    })]))
                }
            }
        }
    }
}
