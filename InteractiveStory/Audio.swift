//
//  Audio.swift
//  InteractiveStory
//
//  Created by Ashwin Iyer on 2017-05-03.
//  Copyright © 2017 It's Happen Inc. All rights reserved.
//

import Foundation
import AudioToolbox

extension Story {
    var soundEffectName: String {
        switch self {
        case .droid, .home : return "HappyEnding"
        case .monster : return "Ominous"
        default : return "PageTurn"
        }
    }
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }
}

class SoundEffectsPlayer {
    var sound: SystemSoundID = 0
    
    func playSound(for story: Story) {
        let soundURL = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        AudioServicesPlaySystemSound(sound)
    }
}
