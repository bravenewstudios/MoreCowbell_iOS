//
//  Conductor.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation
import AVFoundation

class Conductor {
    var song:Song!
    var musicPlayer = AVAudioPlayer()
    
    static let DOTMOVETIME = 1.5
    
    var nextBeatTime = 0.0;
    
    var noteIndex = 0;
    var barIndex = 0;
    var numBars = 0;
    var numNotes = 0;
    
    var isRest = false;
    var isFinished = false;
    var isPlaying = false;
    
    init() {
        barIndex = 0;
        noteIndex = 0;
    }
    
    init(song:Song) {
        barIndex = 0;
        noteIndex = 0;
        self.song = song
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: song.songFile!))
        }
        catch {
            print("failed to load conductor musicPlayer at init")
        }
    }
    
    func SelectSong(song:Song) {
        self.song = song
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: song.songFile!))
        }
        catch {
            print("failed to load conductor musicPlayer at SelectSong")
        }
    }
    
    func Start() {
        isFinished = false;
        isPlaying = true;
        numBars = song.numBars;
        numNotes = song.bars[barIndex].numNotes;
        nextBeatTime = song.startOffset - Conductor.DOTMOVETIME;
        isRest = song.bars[barIndex].notes[noteIndex].isRest;
        musicPlayer.volume = gameInstance.musicVolume
        musicPlayer.play()
    }
    
    func Stop() {
        barIndex = 0;
        noteIndex = 0;
        isFinished = false;
        isPlaying = false;
        musicPlayer.stop()
    }
    
    private func SpawnDot() {
        gameInstance.gameScreen.SpawnDot()
        gameInstance.scoreInfo.totalNotes += 1
    }
    
    private func AdvanceBeat() {
        noteIndex += 1
        if (noteIndex >= numNotes)
        {
            barIndex += 1
            if (barIndex >= numBars)
            {
                isFinished = true;
                return;
            }
            else
            {
                numNotes = song.bars[barIndex].numNotes;
                noteIndex = 0;
            }
        }
        nextBeatTime += song.bars[barIndex].notes[noteIndex].time;
        isRest = song.bars[barIndex].notes[noteIndex].isRest;
    }
    
    func Update() -> Bool {
        if (musicPlayer.isPlaying && !isFinished)
        {
            if (musicPlayer.currentTime >= nextBeatTime)
            {
                if (!isRest) {
                    //Gdx.app.error("Beat", "Index: " + Integer.toString(noteIndex) + "Time: " + Float.toString(nextBeatTime));
                    SpawnDot();
                }
                else {
                    //Gdx.app.error("Rest", "Index: " + Integer.toString(noteIndex) + "Time: " + Float.toString(nextBeatTime));
                }
                //Gdx.app.error("SongPosition", Float.toString(song.track.getPosition()));
                AdvanceBeat();
            }
        }
        return isFinished;
    }
}
