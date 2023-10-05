//
//  STapButton.swift
//  STap
//
//  Created by Yena on 2023/10/05.
//

import SwiftUI

struct STapButton: View {
    private let buttonSize: CGFloat
    
    init(buttonSize: CGFloat) {
        self.buttonSize = buttonSize
    }
    
    var body: some View {
//        GeometryReader { geometry in
//        }
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.green)
            .frame(width: buttonSize,
                   height: buttonSize)
            .shadow(radius: 3)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
            }
    }
}

struct STapButton_Previews: PreviewProvider {
    static var previews: some View {
        STapButton(buttonSize: 320)
    }
}
