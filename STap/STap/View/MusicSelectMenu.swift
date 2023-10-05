//
//  MusicSelectMenu.swift
//  STap
//
//  Created by Yena on 2023/10/05.
//

import SwiftUI

struct Category {
    let title: String
    let url: String
}

struct MusicSelectMenu: View {
    
    
    @ObservedObject var viewModel: MusicsViewModel
    
    let categories: [Category] = [
        Category(title: "최신 음악 TOP 100", url: "PL4fGSI1pDJn6jXS_Tv_N9B8Z0HTRVJE0m"),
        Category(title: "2010년대 가요", url: "PLGR97r28jSO6Uo9ZarSNbbnN2kxjlVdeT"),
        Category(title: "2000년대 가요", url: "PLbQKkth8Igue0EEiG3mjV0EY7MzJwdGZb")
    ]
        
    var body: some View {
        
        VStack {
            Menu("Music Select") {
                ForEach(categories, id: \.title) { category in
                    Button(category.title) {
                        viewModel.action(.selectPlaylist(category.url))
                    }
                }
            }
            
            switch viewModel.state {
            case let .songs(songList):
                PlayerView(viewModel: .init(songs: songList))
                    .padding(.vertical, 20)
                    .padding(.bottom, 20)
            }
        }
    }
}

struct MusicSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelectMenu(viewModel: .init())
    }
}
