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
    
    var conductor = Conductor()
    
    var currentSong = 0
    
    var highscoreTable = [0,0,0]
    var musicVolume:Float = 1.0
    var sfxVolume:Float = 1.0
        
    var songNotes = 1
    var notesHit = 0
    var scoreInfo = Score()
    
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
    
    func LoadSongs() {
        var path = Bundle.main.path(forResource: "reaper",ofType: "json")
        var data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
        var json = try? JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
        var song = json as! [String:Any]
        LoadSongData(jsonSong: song)
    }
    
    func LoadSongData(jsonSong: [String:Any]) {
        let name = jsonSong["name"] as! String
        let bpm = jsonSong["bpm"] as! Double
        let timeSigTop = jsonSong["timeSigTop"] as! Double
        let timeSigBottom = jsonSong["timeSigBottom"] as! Double
        let startOffset = jsonSong["startOffset"] as! Double
        let fileName = jsonSong["fileName"] as! String
        let fileType = jsonSong["fileType"] as! String
        
        var song = Song(name: name, bpm: bpm, timeSigTop: timeSigTop, timeSigBottom: timeSigBottom, startOffset: startOffset, fileName: fileName, fileType: fileType)
        
        let jsonBars = jsonSong["bars"] as! [[String:Any]]
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
