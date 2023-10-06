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
    private let maxScale: CGFloat = 1.5
    

    @StateObject
    var youTubePlayer = YouTubePlayer(source: nil)
    @State var currentSong: Song? = nil
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(10-viewModel.songs.count) Round")
                    .font(Font.system(size: 30, weight: .semibold))
                    .foregroundColor(Color.white)
                
                //Spacer()
            }
            //.padding(.leading, 10)
            
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
                        .fill(Color("darkGreen"))
                    VStack {
                        Button {
                            viewModel.action(.tappedPlayButton)
                            youTubePlayer.play()
                        } label: {
                            suspendingRectangle(title: "이어서 듣기")
//                            VStack {
//
//                                Text("이어서 듣기")
//                                    .font(Font.system(size: 15, weight: .semibold))
//                                    .foregroundColor(Color.white)
//                                    .padding(.vertical, 19)
//                            }
//                            .background(Color.gray)
//                            .cornerRadius(20)
                        }
                        
                        Button {
                            viewModel.action(.tappedPlayButton)
                            youTubePlayer.stop()
                            youTubePlayer.play()
                        } label: {
                            suspendingRectangle(title: "처음부터 다시 듣기")
//                            VStack {
//                                Text("처음부터 다시 듣기")
//                                    .font(Font.system(size: 15, weight: .semibold))
//                                    .foregroundColor(Color.white)
//                                    .padding(.vertical, 19)
//                            }
//                            .background(Color.gray)
//                            .cornerRadius(20)
                        }
                        
                        Button {
                            viewModel.action(.showResult)
                        } label: {
                            suspendingRectangle(title: "결과 보기")
//                            VStack {
//                                Text("결과 보기")
//                                    .font(Font.system(size: 15, weight: .semibold))
//                                    .foregroundColor(Color.white)
//                                    .padding(.vertical, 19)
//                            }
//                            .background(Color.gray)
//                            .cornerRadius(20)
                        }
                    }
                }

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
                    
//                    VStack {
//                        Text("일시정지")
//                            .font(Font.system(size: 15, weight: .semibold))
//                            .foregroundColor(Color.white)
//                            .padding(.vertical, 19)
//                    }
//                    .background(Color.gray)
                }
            case .result:
                Button {
                    viewModel.action(.tappedNextMusicButton)
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("stapGreen"))
                        Text(currentSong?.title ?? "오류")
                            .font(Font.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 19)
                    }
//                    VStack {
//                        Text(currentSong?.title ?? "오류")
//                            .font(Font.system(size: 15, weight: .semibold))
//                            .foregroundColor(Color.black)
//                            .padding(.vertical, 19)
//                    }
//                    .background(Color.gray)
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
