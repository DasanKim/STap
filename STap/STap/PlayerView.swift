//
//  PlayerView.swift
//  STap
//
//  Created by 이호영 on 2023/10/06.
//

import SwiftUI
import YouTubePlayerKit

struct PlayerView: View {
    
    @ObservedObject
    var youTubePlayer = YouTubePlayer(source: nil)
    
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        VStack {
            YouTubePlayerView(self.youTubePlayer)
            .frame(height: 0)
        }
        
        Button {
            youTubePlayer.source = nil
            youTubePlayer.source = .url(url)
            youTubePlayer.play()
            
        } label: {
            Text("처음부터 듣기")
        }
        .frame(height: 10)
        
        Button {
            youTubePlayer.pause()
            
        } label: {
            Text("스탑~~~~~~")
        }
        .frame(height: 10)

        Button {
            youTubePlayer.play()
        } label: {
            Text("다시 시작")
        }
        .frame(height: 10)
        
        
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(url: "www.youtube.com/watch?v=iUw3LPM7OBU")
    }
}
