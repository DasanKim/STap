//
//  ContentView.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            
            HeaderView()
            
            VStack {
                MusicSelectMenu(viewModel: .init())
            }
            .padding(.top, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
