//
//  Score.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

class Score{
    
    var scoreHolder = [Int](arrayLiteral: 0,0,0,0,0,0)
    
    func scoreUpdate(_ score:Int){
        var s = score
        var temp = Float(s)
        var count = 6
        for i in 0..<count
        {
            scoreHolder[i] = Int((temp / pow(10.0, (Float)(count - 1 - i))).truncatingRemainder(dividingBy: 10.0))
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
    
    func scoreReset(){
        scoreUpdate(0)
        }
    }

class Combo{
    
    var comboHolder = [Int](arrayLiteral: 0,0,0)
    
    func comboUpdate(_ combo:Int){
        var c = combo
        var temp = Float(c)
        var count = 3
        for i in 0..<count
        {
            comboHolder[i] = Int((temp / pow(10.0, (Float)(count - 1 - i))).truncatingRemainder(dividingBy: 10.0))
            //           comboHolder[i].sprite = numerals[comboDigits[i]];
        }
    }
    
    //    func comboAdd(_ points:Int){
    //       comboHolder[5] += points
    //        whilecomboHolder[5] > 10 {
    //           comboHolder[4] += 1
    //           comboHolder[5] -= 10
    //        }
    //        whilecomboHolder[4] > 10 {
    //           comboHolder[3] += 1
    //           comboHolder[4] -= 10
    //        }
    //        whilecomboHolder[3] > 10 {
    //           comboHolder[2] += 1
    //           comboHolder[3] -= 10
    //        }
    //        whilecomboHolder[2] > 10 {
    //           comboHolder[1] += 1
    //           comboHolder[2] -= 10
    //        }
    //        whilecomboHolder[1] > 10 {
    //           comboHolder[0] += 1
    //           comboHolder[1] -= 10
    //        }
    //    }
    
    func comboReset(){
        comboUpdate(0)
    }
}

