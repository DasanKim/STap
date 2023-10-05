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
    let categories: [Category] = [
        Category(title: "최신 음악 TOP 100", url: ""),
        Category(title: "2010년대 가요", url: ""),
        Category(title: "2000년대 가요", url: ""),
        Category(title: "1990년대 가요", url: ""),
        Category(title: "만화 주제가", url: ""),
    ]
        
    var body: some View {
        Menu("Music Select") {
            ForEach(categories, id: \.title) { category in
                Button(category.title) { }
            }
        }
    }
}

struct MusicSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelectMenu()
    }
}
