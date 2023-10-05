//
//  MusicsViewModel.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import SwiftUI
import Combine

final class MusicsViewModel: ViewModelable {

    enum Action {
        case selectPlaylist(String)
    }
    
    enum State {
        case songs([Song])
    }
    
    @Published var state: State
    
    init() {
        state = .songs([])
    }
    
    func action(_ action: Action) {
        switch action {
        case .selectPlaylist(let playlist):
            
            youtubeProvider.request(.playlist(playlist)) { result in
                switch result {
                case let .success(getPlaylistResponse):
//                    print(String(data: getPlaylistResponse.data, encoding: .utf8))
                    do {
                        let data = try getPlaylistResponse.data.decode(GetPlaylistSongsDTO.self)
                        
                        let songs = data.items.map {
                            Song(title: $0.snippet.title, videoId: "https://www.youtube.com/watch?v=\($0.snippet.resourceId.videoId)")
                        }.shuffled().prefix(10)
                        
                        print(songs)
                        
                        self.state = .songs(Array(songs))
                    } catch {
                        print(error)
                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
