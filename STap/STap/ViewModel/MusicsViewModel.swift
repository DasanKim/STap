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
        case selectPlaylist(Category)
    }
    
    enum State {
        case songs(String, [Song])
    }
    
    @Published var state: State
    
    init() {
        state = .songs("", [])
    }
    
    func action(_ action: Action) {
        switch action {
        case let .selectPlaylist(category):
            
            youtubeProvider.request(.playlist(category.url)) { result in
                switch result {
                case let .success(getPlaylistResponse):
//                    print(String(data: getPlaylistResponse.data, encoding: .utf8))
                    do {
                        let data = try getPlaylistResponse.data.decode(GetPlaylistSongsDTO.self)
                        
                        let songs = data.items.map {
                            Song(title: $0.snippet.title, videoId: "https://www.youtube.com/watch?v=\($0.snippet.resourceId.videoId)", imageURL: $0.snippet.thumbnails.medium.url)
                        }.shuffled().prefix(10)
                        
                        print(songs)
                        
                        self.state = .songs(category.title ,Array(songs))
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
