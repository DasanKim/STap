//
//  MusicViewModel.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import SwiftUI
import Combine

final class PlayerViewModel: ViewModelable {
    
    enum Action {
        case tappedPlayButton
        case tappedStopButton
        case tappedNextMusicButton
        case startCountDown
        case showResult
    }
    
    enum State {
        case playing
        case result
        case countDown
        case pause
        case wait(Song?)
    }
    
    @Published var state: State
    
    var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs

        let song = self.songs.popFirst()
        state = .wait(song)
        
    }
    
    func action(_ action: Action) {
        switch action {
        case .tappedPlayButton:
            state = .playing
        case .tappedStopButton:
            state = .pause
        case .tappedNextMusicButton:
            let song = self.songs.popFirst()
            state = .wait(song)
        case .startCountDown:
            state = .countDown
        case .showResult:
            state = .result
        }
    }
}

extension Array {
    @inlinable
    public mutating func popFirst() -> Element? {
        if isEmpty {
            return nil
        } else {
            return removeFirst()
        }
    }
}
