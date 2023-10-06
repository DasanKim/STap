//
//  PlayerView.swift
//  STap
//
//  Created by 이호영 on 2023/10/06.
//

import SwiftUI
import YouTubePlayerKit

struct PlayerView: View {
    @State var isAnimation = false
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.3
    

    @StateObject
    var youTubePlayer = YouTubePlayer(source: nil)
    @State var currentSong: Song? = nil
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    if viewModel.songs.isEmpty {
                        Text("노래를 선택해주세요")
                            .font(Font.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.white)
                    } else {
                        Text("\(viewModel.categoryTitle) - \(10-viewModel.songs.count) Round")
                            .font(Font.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20)
                    }
                }
                .frame(height: 40)
                
                Spacer()
            }
            
            
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
                ZStack {
                    Rectangle()
                        .fill(Color("purple"))
                        .cornerRadius(12)
                        .padding(.all, 30)
                    
                    VStack(spacing: 10) {
                        Button {
                            viewModel.action(.tappedPlayButton)
                            youTubePlayer.play()
                        } label: {
                            Image("Play")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .padding(.all, 30)
                        }
                        
                        Button {
                            viewModel.action(.tappedPlayButton)
                            youTubePlayer.stop()
                            youTubePlayer.play()
                        } label: {
                            Image("Repeat")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .padding(.all, 50)
                        }
                        
                        Button {
                            viewModel.action(.showResult)
                        } label: {
                            Image("Album")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .padding(.all, 50)
                        }
                    }
                }
                .padding(.top, 40)

            case .playing:
                Button {
                    viewModel.action(.tappedStopButton)
                    youTubePlayer.pause()
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("purple"))
                            .scaleEffect(isAnimation ? maxScale : 1)
                            .onAppear {
                                withAnimation(self.animation, {
                                    self.isAnimation.toggle()
                                })
                            }
                        Text("")
                            .font(Font.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 19)
                    }
                }
            case .result:
                VStack(spacing: 20) {
                    AsyncImage(url: currentSong?.imageURL)
                                .frame(width: 320, height: 180)
                                .cornerRadius(15)
                    
                    Text(currentSong?.title ?? "오류")
                        .font(Font.system(size: 15, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 30)
                    
                    Button {
                        viewModel.action(.tappedNextMusicButton)
                    } label: {
                        
                        Text("다음 노래")
                            .font(Font.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color("stapGreen"))
                            .cornerRadius(12)
                        
                    }
                }
                .padding(.top, 40)
                
                
            }
            
            YouTubePlayerView(self.youTubePlayer)
            .frame(height: 0)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: .init(categoryTitle: "인기", songs: []))
    }
}
