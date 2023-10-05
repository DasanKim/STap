//
//  STapButton.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct STapButton: View {
    private let buttonSize: CGFloat
    
    init(buttonSize: CGFloat) {
        self.buttonSize = buttonSize
    }
    
    var body: some View {
        Button {
            
        } label: {
            Image("playButton")
                .resizable()
        }
        .frame(width: buttonSize, height: buttonSize)

    }
}

struct STapButton_Previews: PreviewProvider {
    static var previews: some View {
        STapButton(buttonSize: 300)
    }
}
