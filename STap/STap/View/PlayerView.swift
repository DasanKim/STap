//
//  PlayerView.swift
//  STap
//
//  Created by 이호영 on 2023/10/06.
//

import SwiftUI
import YouTubePlayerKit

struct PlayerView: View {

    @StateObject
    var youTubePlayer = YouTubePlayer(source: nil)
    @State var currentSong: Song? = nil
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(viewModel.songs.count)")
                    .font(Font.system(size: 15, weight: .semibold))
                
                Spacer()
            }
            .padding(.leading, 10)
            
            switch viewModel.state {
            case let .wait(song):
                STapButtonView {
                    
                    guard let song = song else {
                        return
                    }
                    youTubePlayer.source = nil
                    currentSong = song
                    
                    viewModel.action(.startCountDown)
                }
            case .countDown:
                CountDownView {
                    guard let currentSong = currentSong else {
                        viewModel.action(.tappedNextMusicButton)
                        return
                    }
                    youTubePlayer.source = .url(currentSong.videoId)
                    youTubePlayer.play()
                    viewModel.action(.tappedPlayButton)
                }
            case .pause:
                
                VStack {
                    Button {
                        viewModel.action(.tappedPlayButton)
                        youTubePlayer.play()
                    } label: {
                        VStack {
                            Text("이어서 듣기")
                                .font(Font.system(size: 15, weight: .semibold))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 19)
                        }
                        .background(Color.gray)
                        .cornerRadius(20)
                    }
                    
                    Button {
                        viewModel.action(.tappedPlayButton)
                        youTubePlayer.stop()
                        youTubePlayer.play()
                    } label: {
                        VStack {
                            Text("처음부터 다시 듣기")
                                .font(Font.system(size: 15, weight: .semibold))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 19)
                        }
                        .background(Color.gray)
                        .cornerRadius(20)
                    }
                    
                    Button {
                        viewModel.action(.showResult)
                    } label: {
                        VStack {
                            Text("결과 보기")
                                .font(Font.system(size: 15, weight: .semibold))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 19)
                        }
                        .background(Color.gray)
                        .cornerRadius(20)
                    }
                }

            case .playing:
                Button {
                    viewModel.action(.tappedStopButton)
                    youTubePlayer.pause()
                } label: {
                    VStack {
                        Text("일시정지")
                            .font(Font.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 19)
                    }
                    .background(Color.gray)
                }
            case .result:
                Button {
                    viewModel.action(.tappedNextMusicButton)
                } label: {
                    VStack {
                        Text(currentSong?.title ?? "오류")
                            .font(Font.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 19)
                    }
                    .background(Color.gray)
                }
                
                
            }
            
            YouTubePlayerView(self.youTubePlayer)
            .frame(height: 0)
        }
        
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: .init(songs: []))
    }
}
