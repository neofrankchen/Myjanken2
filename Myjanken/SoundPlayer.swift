//
//  SoundPlayer.swift
//  Myjanken
//
//  Created by Neo Frank on 2026/5/18.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let jankenData = NSDataAsset(name: "jankenSound")!.data
    
    var jankenPlayer: AVAudioPlayer!
    
    func jankenPlay() {
        do {
            jankenPlayer = try AVAudioPlayer(data: jankenData)
            
            jankenPlayer.play()
        } catch {
            print("janken")
        }
    }
}
