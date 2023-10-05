//
//  ContentView.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                //STapButton(buttonSize: 320)
                CountDown(buttonSize: 320)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("STap")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
