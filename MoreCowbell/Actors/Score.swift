//
//  Score.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class Score{
    
    var scoreCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var scoreHolder = [Int](arrayLiteral: 0,0,0,0,0,0)
    
    var comboCountArray: [SKSpriteNode] = [SKSpriteNode]()
    var comboHolder = [Int](arrayLiteral: 0,0,0)
    
    var currScore:Int = 0
    var currCombo:Int = 0
    var maxCombo:Int = 0
    var totalNotes:Int = 0
    var health:Int = 100
    var notesHit:Int = 0
    var wasLevelCleared:Bool = false
    
    var numberHolder: [SKTexture] = [SKTexture(imageNamed: "0.png"), SKTexture(imageNamed: "1.png"), SKTexture(imageNamed: "2.png"), SKTexture(imageNamed: "3.png"), SKTexture(imageNamed: "4.png"), SKTexture(imageNamed: "5.png"), SKTexture(imageNamed: "6.png"), SKTexture(imageNamed: "7.png"), SKTexture(imageNamed: "8.png"), SKTexture(imageNamed: "9.png")]
    
    init(){
        for _ in 0..<6
        {
            scoreCountArray.append(SKSpriteNode(texture: numberHolder[0]))
        }
        for _ in 0..<3
        {
            comboCountArray.append(SKSpriteNode(texture: numberHolder[0]))
        }
    }
    
    func gainPoints(_ points:Int){
        currCombo += 1
        currScore += points
        notesHit += 1
        health = min(100, health + 5)
        scoreUpdate(currScore, currCombo)
    }
    
    func miss(){
        currCombo = 0
        health -= 10
        scoreUpdate(currScore, currCombo)
    }
    
    func scoreUpdate(_ score:Int, _ combo:Int){
        let s = score
        let temp = Float(s)
        let count = 6
        for i in 0..<count
        {
            scoreHolder[i] = Int((temp / pow(10.0, (Float)(count - 1 - i))).truncatingRemainder(dividingBy: 10.0))
            scoreCountArray[i].texture = numberHolder[scoreHolder[i]]
            //            holder[i].sprite = numerals[scoreDigits[i]];
        }
        let c = combo
        if c > maxCombo{
            maxCombo = c
        }
        let cTemp = Float(c)
        let cCount = 3
        for i in 0..<cCount
        {
            comboHolder[i] = Int((cTemp / pow(10.0, (Float)(cCount - 1 - i))).truncatingRemainder(dividingBy: 10.0))
            comboCountArray[i].texture = numberHolder[comboHolder[i]]
            //            holder[i].sprite = numerals[scoreDigits[i]];
        }
    }
    
//    func scoreAdd(_ points:Int){
//        scoreHolder[5] += points
//        while scoreHolder[5] > 10 {
//            scoreHolder[4] += 1
//            scoreHolder[5] -= 10
//        }
//        while scoreHolder[4] > 10 {
//            scoreHolder[3] += 1
//            scoreHolder[4] -= 10
//        }
//        while scoreHolder[3] > 10 {
//            scoreHolder[2] += 1
//            scoreHolder[3] -= 10
//        }
//        while scoreHolder[2] > 10 {
//            scoreHolder[1] += 1
//            scoreHolder[2] -= 10
//        }
//        while scoreHolder[1] > 10 {
//            scoreHolder[0] += 1
//            scoreHolder[1] -= 10
//        }
//    }
    
    func Reset(){
        currScore = 0
        currCombo = 0
        maxCombo = 0
        notesHit = 0
        totalNotes = 0
        health = 100
        scoreUpdate(currScore, currCombo)
        }
    }

//class Combo{
//
//    var comboCountArray: [SKSpriteNode] = [SKSpriteNode]()
//    var comboHolder = [Int](arrayLiteral: 0,0,0)
//
//    var numberHolder: [SKTexture] = [SKTexture(imageNamed: "0.png"), SKTexture(imageNamed: "1.png"), SKTexture(imageNamed: "2.png"), SKTexture(imageNamed: "3.png"), SKTexture(imageNamed: "4.png"), SKTexture(imageNamed: "5.png"), SKTexture(imageNamed: "6.png"), SKTexture(imageNamed: "7.png"), SKTexture(imageNamed: "8.png"), SKTexture(imageNamed: "9.png")]
//
//    func comboUpdate(_ combo:Int){
//        var c = combo
//        var temp = Float(c)
//        var count = 3
//        for i in 0..<count
//        {
//            comboHolder[i] = Int((temp / pow(10.0, (Float)(count - 1 - i))).truncatingRemainder(dividingBy: 10.0))
//            comboCountArray[i].texture = numberHolder[comboHolder[i]]
//            //           comboHolder[i].sprite = numerals[comboDigits[i]];
//        }
//    }
//
//    //    func comboAdd(_ points:Int){
//    //       comboHolder[5] += points
//    //        whilecomboHolder[5] > 10 {
//    //           comboHolder[4] += 1
//    //           comboHolder[5] -= 10
//    //        }
//    //        whilecomboHolder[4] > 10 {
//    //           comboHolder[3] += 1
//    //           comboHolder[4] -= 10
//    //        }
//    //        whilecomboHolder[3] > 10 {
//    //           comboHolder[2] += 1
//    //           comboHolder[3] -= 10
//    //        }
//    //        whilecomboHolder[2] > 10 {
//    //           comboHolder[1] += 1
//    //           comboHolder[2] -= 10
//    //        }
//    //        whilecomboHolder[1] > 10 {
//    //           comboHolder[0] += 1
//    //           comboHolder[1] -= 10
//    //        }
//    //    }
//
//    func comboReset(){
//        comboUpdate(0)
//    }
//}
//
