//
//  Conductor.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

class Conductor {
    var song:Song!
    
    static let DOTMOVETIME = 1.5
    
    var nextBeatTime = 0.0;
    
    var noteIndex = 0;
    var barIndex = 0;
    var numBars = 0;
    var numNotes = 0;
    var dotIndex = 0;
    
    var isRest = false;
    var isFinished = false;
    
    var dots:[Dot] = [Dot]();
    
    init() {
        dotIndex = 0;
        barIndex = 0;
        noteIndex = 0;
    }
    
    func Start() {
        isFinished = false;
        numBars = song.numBars;
        numNotes = song.bars[barIndex].numNotes;
        nextBeatTime = song.startOffset - Conductor.DOTMOVETIME;
        isRest = song.bars[barIndex].notes[noteIndex].isRest;
        //song.track.play();
    }
    
    func Stop() {
        dotIndex = 0;
        barIndex = 0;
        noteIndex = 0;
        isFinished = false;
        //song.track.stop();
    }
    
    func SpawnDot() {
        dots[dotIndex].FireAction()
        dotIndex += 1
        if (dotIndex >= dots.count)
        {
            dotIndex = 0;
        }
    }
    
    func AdvanceBeat() {
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
        if (song.track.isPlaying() && !isFinished)
        {
            if (song.track.getPosition() >= nextBeatTime)
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
