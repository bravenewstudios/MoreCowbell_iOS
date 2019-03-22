//
//  StartScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class StartScreen: SKScene {
    
    //TODO: - Use this to create a menu scene
    var optionsButton:SKSpriteNode!
    var background:SKSpriteNode!
    var titleMore:SKSpriteNode!
    var titleCowbell:SKSpriteNode!
    var walkenHead:SKSpriteNode!
    var sliderBar:SKSpriteNode!
    var slider:SKSpriteNode!
    var MMLabel:SKLabelNode!
//    private var spinnyNode : SKShapeNode?
//    private var label : SKLabelNode?
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize) {
        super.init(size: size)
        
       background = SKSpriteNode(texture: SKTexture(imageNamed: "sunburst"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.setScale(2)
        background.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(-0.3), duration: 1)))
        addChild(background)

        optionsButton = SKSpriteNode(texture: SKTexture(imageNamed: "gear"))
        optionsButton.position = CGPoint(x: 5 * (UIScreen.main.bounds.width) / 6, y: UIScreen.main.bounds.height / 10)
        optionsButton.setScale(0.5)
        optionsButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(0.25), duration: 1)))
        addChild(optionsButton)
        
        titleMore = SKSpriteNode(texture: SKTexture(imageNamed: "title_more"))
        titleMore.setScale(0.3)
        titleMore.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: 5 * UIScreen.main.bounds.height / 6.1)
        addChild(titleMore)

        titleCowbell = SKSpriteNode(texture: SKTexture(imageNamed: "title_cowbell"))
        titleCowbell.setScale(0.3)
        titleCowbell.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: 3 * UIScreen.main.bounds.height / 4)
        addChild(titleCowbell)

        walkenHead = SKSpriteNode(texture: SKTexture(imageNamed: "Walken_head"))
        walkenHead.setScale(0.3)
        walkenHead.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        addChild(walkenHead)
        
//        sliderBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
//        sliderBar.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(sliderBar)
//
//        slider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
//        slider.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(slider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
