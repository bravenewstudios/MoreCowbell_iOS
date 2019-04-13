//
//  Bar.swift
//  MoreCowbell
//
//  Created by Tech on 2019-04-08.
//  Copyright © 2019 BraveNewStudios. All rights reserved.
//

import Foundation

public class Bar {
    
    // which type of note equals a beat is defined by the time signature
    // EXAMPLE:
    // >in 4/4 time the quarter note is one beat
    // >timeSigBottom (4.0f) * QUARTER (0.25f) * beat (60.0f/bpm) = duration of note
    
    var notes:[Note] = [Note]()
    var numNotes = 0
    
    init() {

    }
    
    init(numNotes:Int) {
        self.numNotes = numNotes;
        //self.notes = new Note[numNotes];
    }
    
    // doesn't work because of float arithmetic error
    func Verify(beat:Double, timeSigTop:Double, timeSigBottom:Double) -> Bool
    {
        let expectedDuration = timeSigTop * beat;
        var checkedDuration = 0.0;
        for i in 0..<numNotes {
            checkedDuration += notes[i].time * beat * timeSigBottom;
        }
        if (checkedDuration == expectedDuration)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
