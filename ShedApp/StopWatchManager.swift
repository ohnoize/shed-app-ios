//
//  StopWatchManager.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var secondsElapsed = 0
    @Published var mode: stopWatchMode = .stopped
    
    var timer = Timer()
    
    var startTime = DispatchTime.now()
    
    func handleAltTime(startTime: Double) -> Int {
        var altTime = 0
        let timeNow = Double(DispatchTime.now().rawValue)
        let altSeconds = (timeNow - startTime) / 1e+9
        altTime = Int(altSeconds.rounded(.down))
        return altTime
    }
    
    func start() {
        mode = .running
        
        let startTime = DispatchTime.now()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
            var altTime = 0
            altTime = self.handleAltTime(startTime: Double(startTime.rawValue))
            if altTime > self.secondsElapsed {
                self.secondsElapsed = altTime
            }
        }
    }
    
    func pause() {
        mode = .paused
        timer.invalidate()
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}
