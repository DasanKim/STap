//
//  STapButton.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct STapButton: View {
    @Binding var isTappedPlay: Bool
    let buttonSize: CGFloat
    
    var body: some View {
        Button {
            isTappedPlay.toggle()
        } label: {
            Image("playButton")
                .resizable()
        }
        .frame(width: buttonSize, height: buttonSize)

    }
}

struct STapButton_Previews: PreviewProvider {
    static var previews: some View {
        STapButton(isTappedPlay:.constant(false), buttonSize: 300)
    }
}
