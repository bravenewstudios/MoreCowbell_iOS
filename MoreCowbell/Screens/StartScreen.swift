//
//  StartScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScreen: SKScene {
    
    lazy var optionsButton:SpriteButton = {
        var button = SpriteButton(imageName: "gear", buttonAction: {
            //self.view?.presentScene(GameScene(size: self.frame.size))
        })
        button.zPosition = 4
        return button
    }()
    
    //TODO: - Use this to create a menu scene
    //var optionsButton:SKSpriteNode!
    var background:SKSpriteNode!
    var titleMore:SKSpriteNode!
    var titleCowbell:SKSpriteNode!
    var walkenHead:SKSpriteNode!
    var sliderBar:SKSpriteNode!
    var slider:SKSpriteNode!
    var MMLabel:SKLabelNode!
    var objPlayer2:SKAudioNode! //= nil
//    private var spinnyNode : SKShapeNode?
//    private var label : SKLabelNode?
    
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize) {
        super.init(size: size)
        
        objPlayer2 = SKAudioNode(fileNamed: "surf.mp3")
        //print(objPlayer2?.avAudioNode!)
        addChild(objPlayer2)
        objPlayer2.run(SKAction.play())
        
        setBackground()
        setTitle()
        setButtons()

//        sliderBar = SKSpriteNode(texture: SKTexture(imageNamed: "slider_bar"))
//        sliderBar.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(sliderBar)
//
//        slider = SKSpriteNode(texture: SKTexture(imageNamed: "slider"))
//        slider.position = CGPoint(x: 2 * (UIScreen.main.bounds.width) / 3, y: UIScreen.main.bounds.height / 2)
//        addChild(slider)
    }
    
    func setBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "sunburst"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.name = "_background"
        background.setScale(1)
        background.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(-0.3), duration: 1)))
        addChild(background)
        
    }
    
    func setTitle()
    {
        titleCowbell = SKSpriteNode(texture: SKTexture(imageNamed: "title_cowbell"))
        titleCowbell.setScale(0.3)
        titleCowbell.position = CGPoint(x: UIScreen.main.bounds.width / 2 - titleCowbell.size.width / 2.8, y: 3 * UIScreen.main.bounds.height / 4 - titleCowbell.size.height / 2)
        titleCowbell.anchorPoint = CGPoint(x: 0.2,y: 0.0)
        addChild(titleCowbell)
        
        titleMore = SKSpriteNode(texture: SKTexture(imageNamed: "title_more"))
        titleMore.setScale(0.3)
//        titleMore.zPosition = 5
        titleMore.position = CGPoint(x: titleCowbell.position.x + titleCowbell.size.width * 0.48 + titleMore.size.width * 0.33, y: titleCowbell.position.y + titleMore.size.height * 0.8)
        titleMore.anchorPoint = CGPoint(x: 1.0,y: 0.0)
        addChild(titleMore)
        
        let rotateMoreText = SKAction.rotate(byAngle: CGFloat(Double.pi / 9), duration: 0)
        let reverseMoreText = SKAction.rotate(byAngle: CGFloat(-Double.pi / 9), duration: 0)
        let rotateCowText = SKAction.rotate(byAngle: CGFloat(Double.pi / 36), duration: 0)
        let reverseCowText = SKAction.rotate(byAngle: CGFloat(-Double.pi / 36), duration: 0)
        let rotHead = SKAction.rotate(byAngle: CGFloat(-Double.pi / 9), duration: 0)
        let rotRevHead = SKAction.rotate(byAngle: CGFloat(Double.pi / 9), duration: 0)
        let delay = SKAction.wait(forDuration: 0.98)
        
        walkenHead = SKSpriteNode(texture: SKTexture(imageNamed: "Walken_head"))
        walkenHead.setScale(0.3)
        walkenHead.zRotation = CGFloat(Double.pi / 18)
        walkenHead.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        addChild(walkenHead)
        
        titleMore.run(SKAction.repeatForever(SKAction.sequence([reverseMoreText,delay,rotateMoreText,delay])))
        titleCowbell.run(SKAction.repeatForever(SKAction.sequence([delay,reverseCowText,delay,rotateCowText])))
        walkenHead.run(SKAction.repeatForever(SKAction.sequence([delay,rotHead,delay,rotRevHead])))
    }
    
    func setButtons()
    {
        //optionsButton = SKSpriteNode(texture: SKTexture(imageNamed: "gear"))
        optionsButton.position = CGPoint(x: 5 * (UIScreen.main.bounds.width) / 6, y: UIScreen.main.bounds.height / 10)
        optionsButton.setScale(0.5)
        optionsButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(0.25), duration: 1)))
        addChild(optionsButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                if n.name == "_background" {
                    //print("YAY!")
                    scene?.view?.presentScene(MapScreen(size: self.frame.size))
                }
            }
            //TODO: - Create a transition
            if walkenHead.frame.contains(t.preciseLocation(in: inputView)){
                scene?.view?.presentScene(MapScreen(size: self.frame.size))
                
            }
            
        }
    }
}
