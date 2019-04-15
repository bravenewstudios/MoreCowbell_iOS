//
//  GameScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScreen: BaseScene {
    
    //TODO: - Use this to create a menu scene
    var background:SKSpriteNode!
    var exitButton:SKSpriteNode!
    var scoreCounter:SKSpriteNode!
    var score0:SKSpriteNode!; var score1:SKSpriteNode!; var score2:SKSpriteNode!;
    var score3:SKSpriteNode!; var score4:SKSpriteNode!; var score5:SKSpriteNode!;
    var combo0:SKSpriteNode!; var combo1:SKSpriteNode!; var combo2:SKSpriteNode!;
    var scoreCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var comboCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var comboCounter:SKSpriteNode!
    var dangerOverlay:SKSpriteNode!
    var beatBar:SKSpriteNode!
    var cowbell:SKSpriteNode!
    var MMLabel:SKLabelNode!
    var scoreInfo = gameInstance.scoreInfo
    var fire:[SKEmitterNode] = [SKEmitterNode]()
    var burst:SKEmitterNode!
    var dangerFade:SKAction!
    var fireIndex = 0
    
    var dots:[Dot] = [Dot]()
    var dotIndex = 0
    
    var hitPositionX:CGFloat!
    var hitTolerance:CGFloat!
    
    var bruceHead:SKSpriteNode!
    var guitarHead:SKSpriteNode!
    
    var guitarPeek:SKAction!
    var brucePeek:SKAction!
    
    var sfxArray:[SKAction] = [SKAction]()
    var prescription = SKAction.playSoundFileNamed("prescription.wav", waitForCompletion: false);
    var blow = SKAction.playSoundFileNamed("dontblowthis.wav", waitForCompletion: false)
    var more = SKAction.playSoundFileNamed("couldusemore.wav", waitForCompletion: false)
    
    //TODO: - Add a main menu and play button
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupBackground()
        setupCowbell()
        setupBar()
        setupButtons()
        setupScore()
        setupDots()
        setupParticles()
    }
    
    override func OnScenePresent() {
        gameInstance.conductor.Start()
    }
    
    override func OnSceneExit() {
        gameInstance.conductor.Stop()
        dangerOverlay.removeAllActions()
        dangerOverlay.alpha = 0
        gameInstance.updateHighscore(gameInstance.scoreInfo.currScore, level: gameInstance.currentSong)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // returns true at end of song
        if gameInstance.conductor.Update(){
            endLevel(bool: true)
        }
    }
    
    func OnHit(dot:Dot) {
        scoreInfo.gainPoints(scoreInfo.currCombo / 10 + 1)
        fire[fireIndex].position = dot.position
        fire[fireIndex].resetSimulation()
        fireIndex += 1
        if(fireIndex >= fire.count){
            fireIndex = 0
        }
        dot.hit = true
        if(scoreInfo.currCombo > 1 && scoreInfo.currCombo % 10 == 0){
            playBurst()
        }
        if(dangerOverlay.alpha > 0) {
            dangerOverlay.removeAllActions()
            dangerOverlay.alpha = 0
        }
    }
    
    func playBurst(){
        burst.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.7)
        burst.resetSimulation()
        if(!bruceHead.hasActions()){
        run(prescription)
        bruceHead.run(brucePeek)
        }
    }
    
    func OnMiss() {
        scoreInfo.miss()
        
        if(scoreInfo.health == 30 || scoreInfo.health == 25){
            if(!guitarHead.hasActions()){
                run(blow)
                guitarHead.run(guitarPeek)
            }
        }
        else if (scoreInfo.health == 60 || scoreInfo.health == 55)
        {
            run(more)
        }
        if (scoreInfo.health <= 30)
        {
            dangerOverlay.run(SKAction.repeatForever(dangerFade))
        }
        if (scoreInfo.health <= 0)
        {
            endLevel(bool: false)
        }
    }
    
    func endLevel(bool:Bool){
        scoreInfo.wasLevelCleared = bool
        scene?.view?.presentScene(gameInstance.resultScreen)
    }
    
    func SpawnDot() {
        //called by conductor
        dots[dotIndex].FireAction()
        dotIndex += 1
        if (dotIndex >= dots.count)
        {
            dotIndex = 0;
        }
    }
    
    func setupDots() {
        for _ in 1...16 {
            let dot = Dot(beatBar, UIScreen.main.bounds)
            addChild(dot)
            dots.append(dot)
        }
        hitPositionX = UIScreen.main.bounds.width / 2 - (beatBar.size.width / 2) * 0.78
        hitTolerance = dots[0].size.width / 2
    }
    
    func setupParticles() {
        for _ in 1...16 {
            let f1 = SKEmitterNode(fileNamed: "Fire.sks")!
            addChild(f1)
            fire.append(f1)
        }
        burst = SKEmitterNode(fileNamed: "Nova.sks")
        addChild(burst)
    }
    
    func setupBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        scoreCounter = SKSpriteNode(texture: SKTexture(imageNamed: "ScoreCounter"))
        scoreCounter.position = CGPoint(x: (UIScreen.main.bounds.width) / 4, y: UIScreen.main.bounds.height / 13)
        //scoreCounter.size.width =
        //scoreCounter.size.height =
        scoreCounter.setScale(0.3)
        scoreCounter.zPosition = 5
        addChild(scoreCounter)
        
        comboCounter = SKSpriteNode(texture: SKTexture(imageNamed: "ComboCounter"))
        comboCounter.setScale(0.3)
        comboCounter.position = CGPoint(x: scoreCounter.position.x - (scoreCounter.size.width - comboCounter.size.width) / 2, y: scoreCounter.position.y + scoreCounter.size.height)
        comboCounter.zPosition = 5
        addChild(comboCounter)
        
        dangerOverlay = SKSpriteNode(texture: SKTexture(imageNamed: "danger_overlay"))
        dangerOverlay.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        dangerOverlay.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        dangerOverlay.alpha = 0.0
        addChild(dangerOverlay)
        
        dangerFade = SKAction.sequence([SKAction.fadeIn(withDuration: 0.5), SKAction.fadeAlpha(to: 0.1, duration: 0.5)])
        
        sfxArray.append(prescription)
        sfxArray.append(blow)
        sfxArray.append(more)
        
        bruceHead = SKSpriteNode(texture: SKTexture(imageNamed: "Walken_head"))
        bruceHead.setScale(0.3)
        bruceHead.position = CGPoint(x: UIScreen.main.bounds.width + bruceHead.size.width, y: UIScreen.main.bounds.height * 0.9)
        bruceHead.zRotation = CGFloat(Double.pi / 18)
        guitarHead = SKSpriteNode(texture: SKTexture(imageNamed: "guitarist"))
        guitarHead.setScale(0.5)
        guitarHead.position = CGPoint(x: -guitarHead.size.width, y: UIScreen.main.bounds.height * 0.9)
        guitarHead.zRotation = CGFloat(-Double.pi / 9)
        addChild(bruceHead)
        addChild(guitarHead)
        
        brucePeek = SKAction.sequence([SKAction.move(by: CGVector(dx: -bruceHead.size.width * 1.3, dy: CGFloat(0)), duration: 0.1),SKAction.wait(forDuration: 3.2), SKAction.move(by: CGVector(dx: bruceHead.size.width * 1.3, dy: CGFloat(0)), duration: 0.1)])
        
        guitarPeek = SKAction.sequence([SKAction.move(by: CGVector(dx: guitarHead.size.width * 1.2, dy: CGFloat(0)), duration: 0.1),SKAction.wait(forDuration: 1.5), SKAction.move(by: CGVector(dx: -guitarHead.size.width * 1.2, dy: CGFloat(0)), duration: 0.1)])
    }
    
    func setupCowbell()
    {
        cowbell = SKSpriteNode(texture: SKTexture(imageNamed: "cowbell"))
        cowbell.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height * 9 / 16)
        cowbell.setScale(1)
        cowbell.name = "cowbell"
        addChild(cowbell)
    }
    
    func setupBar()
    {
        beatBar = SKSpriteNode(texture: SKTexture(imageNamed: "beat_bar"))
        beatBar.position = CGPoint(x:(UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height * 9 / 16)
        beatBar.setScale(0.8)
        addChild(beatBar)
    }
    
    func setupButtons()
    {
        exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "exit"))
        exitButton.position = CGPoint(x: 9 * (UIScreen.main.bounds.width) / 10, y: UIScreen.main.bounds.height / 13)
        exitButton.setScale(0.2)
        exitButton.name = "_exit"
        addChild(exitButton)
    }
    
    func setupScore()
    {
        score0 = scoreInfo.scoreCountArray[0]; scoreCountArray.append(score0); score0.name = "score"
        score1 = scoreInfo.scoreCountArray[1]; scoreCountArray.append(score1)
        score2 = scoreInfo.scoreCountArray[2]; scoreCountArray.append(score2)
        score3 = scoreInfo.scoreCountArray[3]; scoreCountArray.append(score3)
        score4 = scoreInfo.scoreCountArray[4]; scoreCountArray.append(score4)
        score5 = scoreInfo.scoreCountArray[5]; scoreCountArray.append(score5)
        combo0 = scoreInfo.comboCountArray[0]; comboCountArray.append(combo0)
        combo1 = scoreInfo.comboCountArray[1]; comboCountArray.append(combo1)
        combo2 = scoreInfo.comboCountArray[2]; comboCountArray.append(combo2)
        
        for s in 0...5 {
            scoreCountArray[s].setScale(0.3)
            let i = (scoreCountArray[s].size.width + 1.5) * CGFloat(2 * s) + 35
            let r = 3 * (0.5 - drand48())
            scoreCountArray[s].position = CGPoint(x: scoreCounter.position.x - scoreCounter.size.width / 2 + i / 2, y: scoreCounter.position.y - scoreCounter.size.height / 8 + CGFloat(r))
            scoreCountArray[s].zPosition = scoreCounter.zPosition - 1
            addChild(scoreCountArray[s])
        }
        
        for c in 0...2 {
            comboCountArray[c].setScale(0.3)
            let i = (comboCountArray[c].size.width + 1.5) * CGFloat(2 * c) + 35
            let r = 3 * (0.5 - drand48())
            comboCountArray[c].position = CGPoint(x: comboCounter.position.x - comboCounter.size.width / 2 + i / 2, y: comboCounter.position.y - comboCounter.size.height / 8 + CGFloat(r))
            comboCountArray[c].zPosition = comboCounter.zPosition - 1
            addChild(comboCountArray[c])
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                
                if n == cowbell {
                    //if it's a valid "hit"
                    for dot in dots {
                        if dot.position.x >= hitPositionX - hitTolerance && dot.position.x <= hitPositionX + hitTolerance {
                            OnHit(dot: dot)
                            return;
                        }
                    }
                    OnMiss()
                    return;
                }
                
                else if n == exitButton {
                    //print("YAY!")
                    scene?.view?.presentScene(gameInstance.startScreen)
                    //                    let mapScene:SKScene = MapScreen(size: self.frame.size)
                    //                    let transition = SKTransition.push(with: .down, duration: 1)
                    //                    self.view?.presentScene(mapScene, transition: transition)
                }
                
//                else if n.name == "score" {
//                    endLevel(bool: true)
//                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
