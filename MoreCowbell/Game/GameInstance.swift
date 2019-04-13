//
//  GameInstance.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import SpriteKit

class GameInstance {
    var currentSong = 0
    
    var highscoreTable = [0,0,0]
    var musicVolume:Float = 1.0
    var sfxVolume:Float = 1.0
    
    var startScreen:StartScreen!
    var mapScreen:MapScreen!
    var gameScreen:GameScreen!
    var resultScreen:ResultScreen!
    
    // dictionary for song data
    var album: [String: Song] = [:]
    
    init(){
    }
    
    func LoadScenes(viewSize:CGSize) {
        startScreen = StartScreen(size: viewSize)
        mapScreen = MapScreen(size: viewSize)
        gameScreen = GameScreen(size: viewSize)
        resultScreen = ResultScreen(size: viewSize)
        
        startScreen.scaleMode = .aspectFill
        mapScreen.scaleMode = .aspectFill
        gameScreen.scaleMode = .aspectFill
        resultScreen.scaleMode = .aspectFill
        
        /*
        startScreen.SetGameInstance(inst: self)
        mapScreen.SetGameInstance(inst: self)
        gameScreen.SetGameInstance(inst: self)
        resultScreen.SetGameInstance(inst: self)
         */
    }
    
    func LoadSongData(json: [String:Any]) {
        let name = json["name"] as! String
        let bpm = json["bpm"] as! Double
        let timeSigTop = json["timeSigTop"] as! Double
        let timeSigBottom = json["timeSigBottom"] as! Double
        let startOffset = json["startOffset"] as! Double
        let fileName = json["fileName"] as! String
        let fileType = json["fileType"] as! String
        
        var song = Song(name: name, bpm: bpm, timeSigTop: timeSigTop, timeSigBottom: timeSigBottom, startOffset: startOffset, fileName: fileName, fileType: fileType)
        
        let jsonBars = json["bars"] as! [[String:Any]]
        for jsonBar in jsonBars {
            var bar = Bar()
            let jsonNotes = jsonBar["notes"] as! [[String:Any]]
            for jsonNote in jsonNotes {
                var note = Note()
                note.isRest = jsonNote["isRest"] as! Bool
                note.time = jsonNote["time"] as! Double
                bar.notes.append(note)
            }
            bar.numNotes = bar.notes.count
            song.bars.append(bar)
        }
        song.numBars = song.bars.count
        album[name] = song
    }
    
    func updateHighscore(_ score:Int, level:Int){
       if(highscoreTable[level] < score){
                highscoreTable[level] = score
            }
        }
    
    func sfxVolumeChange(_ vol:Float){
        sfxVolume = vol
    }
    
    func musicVolumeChange(_ vol:Float){
        musicVolume = vol
    }
}
