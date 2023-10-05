//
//  ContentView.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MusicsViewModel
    @State private var isTappedPlay: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if isTappedPlay == false {
                    STapButton(isTappedPlay: $isTappedPlay, buttonSize: 320)
                } else {
                    CountDown(buttonSize: 320)
                }
                
                PlayerView(url: "https://www.youtube.com/watch?v=iUw3LPM7OBU")
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("STap")
            VStack(alignment: .center) {
                //STapButton(buttonSize: 320)
                
                Button {
                    viewModel.action(.selectPlaylist("PLbQKkth8Igue0EEiG3mjV0EY7MzJwdGZb"))
                } label: {
                    Text("Youtube")
                }
                
                switch viewModel.state {
                case let .songs(songs):
                    VStack {
                        ForEach(songs) { song in
                            Text(song.title)
                        }
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
