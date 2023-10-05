//
//  MusicViewModel.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import SwiftUI
import Combine

final class PlayerViewModel: ViewModelable {
    enum playingState {
        case playing
        case pause
        case wait
    }
    
    enum Action {
        case tappedPlayButton
        case tappedStopButton
        case tappedNextMusicButton
    }
    
    enum State {
        case playing(playingState)
    }
    
    @Published var state: State
    
    init() {
        state = .playing(.wait)
    }
    
    func action(_ action: Action) {
        switch action {
        case .tappedPlayButton:
            state = .playing(.playing)
        case .tappedStopButton:
            state = .playing(.pause)
        case .tappedNextMusicButton:
            state = .playing(.wait)
        }
    }
}
