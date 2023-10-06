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
        Category(title: "최신 음악", url: "PL4fGSI1pDJn6jXS_Tv_N9B8Z0HTRVJE0m"),
        Category(title: "2010년대 가요", url: "PLqYXnjkoLTa9dFhDL7ZU7zgp4Sleer-ZY"),
        Category(title: "만화 주제가", url: "PLqYXnjkoLTa9kq9BpotoLA7oRZXXRLHAP")
    ]
        
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Text("Categories")
                        .font(Font.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("swhite"))
                        .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.leading, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.title) { category in
                            
                            Button {
                                viewModel.action(.selectPlaylist(category))
                            } label: {
                                VStack(spacing: 10) {
                                    
                                    Text(category.title)
                                        .foregroundColor(Color("background"))
                                        .font(Font.system(size: 12, weight: .semibold))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 10)
                                }
                                .frame(width: 100, height: 30)
                                .background(Color("syellow"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            switch viewModel.state {
            case .songs(let title, let songList):
                PlayerView(viewModel: .init(categoryTitle: title, songs: songList))
                    .frame(maxHeight: .infinity)
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
