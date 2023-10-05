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
            HeaderView()
            
            VStack {
                MusicSelectMenu(viewModel: .init())
                
                
            }
            .padding(.top, 30)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
