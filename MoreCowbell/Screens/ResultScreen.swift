//
//  ResultScreen.swift
//  MoreCowbell
//
//  Created by Tech on 2019-03-22.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

// import Foundation
import SpriteKit
import GameplayKit

class ResultScreen: BaseScene {
    
    var background:SKSpriteNode!
    var NotePaper:SKSpriteNode!
    
    let resultsFont = UIFont(name: "McHandwriting", size: 50)
    var accuracy:SKLabelNode!; var score:SKLabelNode!; var combo:SKLabelNode!
    var labelArray: [SKLabelNode] = [SKLabelNode]()
    var grade = SKSpriteNode(texture: SKTexture(imageNamed: "RankF.png"))
    var exitButton:SKSpriteNode!
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupBackground()
        exit()
        setupResults()
    }
    
    override func OnScenePresent() {
        GetResultData()
    }
    
    func exit() {
        exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "exit"))
        exitButton.position = CGPoint(x: 9 * (UIScreen.main.bounds.width) / 10, y: UIScreen.main.bounds.height / 13)
        exitButton.setScale(0.2)
        exitButton.name = "_exit"
        addChild(exitButton)
    }
    
    func setupResults() {
        NotePaper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
        NotePaper.size = CGSize(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.6)
    //NotePaper.size(screenHeight,screenWidth,0.8f,mainStage,"results_overlay.png");
        NotePaper.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height/2)
        addChild(NotePaper)
    
        accuracy = SKLabelNode(fontNamed: "McHandwriting"); labelArray.append(accuracy)
        score = SKLabelNode(fontNamed: "McHandwriting"); labelArray.append(score)
        combo = SKLabelNode(fontNamed: "McHandwriting"); labelArray.append(combo)
        accuracy.position = CGPoint(x: NotePaper.size.width / 7, y:NotePaper.size.height * 33/144)
        score.position = CGPoint(x: NotePaper.size.width / 7, y:NotePaper.size.height * 17/144)
        combo.position = CGPoint(x: NotePaper.size.width / 7, y:NotePaper.size.height / 144)
        
        grade.position = CGPoint(x: NotePaper.size.width / 4, y: -NotePaper.size.height / 4)
        grade.setScale(2)
//        self.view?.addSubview(accuracy)
//        self.view?.addSubview(score)
//        self.view?.addSubview(combo)
        NotePaper.addChild(grade)
        
        for t in labelArray{
            t.horizontalAlignmentMode = .center
            t.fontColor = UIColor.black
            t.text = ""
            NotePaper.addChild(t)
        }
    }
    
    func GetResultData() {
        if(gameInstance.scoreInfo.totalNotes != 0)
        {
            let pct = gameInstance.scoreInfo.notesHit * 100 / gameInstance.scoreInfo.totalNotes
            let accPct = String(Int(pct))
//    accuracy.setText(Integer.toString(pct));
            var letter:SKTexture!
            var music = SKAudioNode(fileNamed: "cowbell.wav")
            if (!gameInstance.scoreInfo.wasLevelCleared)
            {
                letter = SKTexture(imageNamed: "RankF.png")
                music = SKAudioNode(fileNamed: "comeongene.wav")
            }
            else if (pct >= 90) {
                music = SKAudioNode(fileNamed: "diapers.wav")
                letter = SKTexture(imageNamed: "RankAPlus.png")
            }
            else if (pct >= 80) {
                letter = SKTexture(imageNamed: "RankA.png")
                music = SKAudioNode(fileNamed: "dynamiteSound.wav")
            }
            else if (pct >= 70)
            {
                letter = SKTexture(imageNamed: "RankB.png")
                music = SKAudioNode(fileNamed: "couldusemore.wav")
            }
            else if (pct >= 60)
            {
                letter = SKTexture(imageNamed: "RankC.png")
                music = SKAudioNode(fileNamed: "couldusemore.wav")
            }
            else if (pct >= 50)
            {
                letter = SKTexture(imageNamed: "RankD.png")
                music = SKAudioNode(fileNamed: "couldusemore.wav")
            }
            else
            {
                letter = SKTexture(imageNamed: "RankF.png")
                music = SKAudioNode(fileNamed: "couldusemore.wav")
            }
            
            music.autoplayLooped = false
            music.run(SKAction.changeVolume(to: gameInstance.sfxVolume, duration: 0.0))
            addChild(music)
            music.run(SKAction.play())
            grade.texture = letter
            accuracy.text = "Accuracy: " + accPct + "%"
            score.text = "Score: " + String(gameInstance.scoreInfo.currScore)
            combo.text = "Max Combo: " + String(gameInstance.scoreInfo.maxCombo)
        }
    }
    
    func setupBackground()
    {
        background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark"))
        background.position = CGPoint(x: (UIScreen.main.bounds.width) / 2, y: UIScreen.main.bounds.height / 2)
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = nodes(at: t.location(in: self))
            
            for n in node {
                
                //MARK: - If notification button is pressed
                if n.name == "_exit" {
                    //print("YAY!")
                    scene?.view?.presentScene(gameInstance.startScreen)
                    //                    let mapScene:SKScene = MapScreen(size: self.frame.size)
                    //                    let transition = SKTransition.push(with: .down, duration: 1)
                    //                    self.view?.presentScene(mapScene, transition: transition)
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
