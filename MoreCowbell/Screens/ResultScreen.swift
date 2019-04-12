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
    
    let resultsFont = UIFont(name: "OLORT___", size: UIFont.labelFontSize)
    var accuracy:UILabel!
    var score:UILabel!
    var combo:UILabel!
    var grade:UILabel!
    var labelRect:CGRect!
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        setupResults()
        SetupBackground()
        GetResultData()
        
    }
    
    func setupResults() {
        NotePaper = SKSpriteNode(texture: SKTexture(imageNamed: "paper_narrow"))
    //NotePaper.size(screenHeight,screenWidth,0.8f,mainStage,"results_overlay.png");
        NotePaper.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height)
    
        labelRect = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        accuracy = UILabel(frame: labelRect)
        score = UILabel(frame: labelRect)
        combo = UILabel(frame: labelRect)
        grade = UILabel(frame: labelRect)//new Label("B", new Label.LabelStyle(resultsFont, Color.RED));
        accuracy.frame(to: CGPoint(x:UIScreen.main.bounds.width * 0.655, y:UIScreen.main.bounds.height * 0.659))
        accuracy.font = resultsFont
    combo.closestPosition(to: CGPoint(x:UIScreen.main.bounds.width * 0.49, y:UIScreen.main.bounds.height * 0.59))
    combo.font = resultsFont
        //combo.setFontScale(2);
    score.closestPosition(to: CGPoint(x:UIScreen.main.bounds.width * 0.7, y:UIScreen.main.bounds.height * 0.52))
    score.font = resultsFont
//        score.setFontScale(2);
    grade.closestPosition(to: CGPoint(x:UIScreen.main.bounds.width * 0.61, y:UIScreen.main.bounds.height * 0.38))
    grade.font = resultsFont
        //grade.setFontScale(5);
    addChild(accuracy);
    addChild(score);
    addChild(combo);
    addChild(grade);
    }
    
    func GetResultData() {
    let pct = game.result.notesHit * 100 / game.result.totalNotes;
    accuracy.setText(Integer.toString(pct));
        var letter:String
        var music:SKAudioNode!
    if (pct >= 80)
    {
    letter = "A"
        if (pct >= 90) {
    music = SKAudioNode(fileNamed: "diapers.wav")
        }
        else {
    music = SKAudioNode(fileNamed: "dynamiteSound.wav")
    }
    }
    else if (pct >= 70)
    {
    letter = "B"
    music = SKAudioNode(fileNamed: "couldusemore.wav")
    }
    else if (pct >= 60)
    {
    letter = "C"
        music = SKAudioNode(fileNamed: "couldusemore.wav")
    }
    else if (pct >= 50)
    {
    letter = "D"
        music = SKAudioNode(fileNamed: "couldusemore.wav")
    }
    else
    {
    letter = "F";
        music = SKAudioNode(fileNamed: "couldusemore.wav")
    }
    if (pct == 0)
    {
    letter = "F";
        music = SKAudioNode(fileNamed: "comeongene.wav")
    }
        music.run(SKAction.changeVolume(to: gameInstance.musicVolume, duration: 0.0))
        addChild(music)
    grade.setText(letter);
    score.setText(Integer.toString(game.result.score));
    combo.setText(Integer.toString(game.result.maxCombo));
    }
    
    func SetupBackground() {
    background = SKSpriteNode(texture: SKTexture(imageNamed: "stage_dark.png"))
    addChild(background)
    }
}
