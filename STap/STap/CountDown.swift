//
//  CountDown.swift
//  STap
//
//  Created by Yena on 2023/10/05.
//

import SwiftUI

struct CountDown: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var count: Int = 1
    private let buttonSize: CGFloat
    
    init(buttonSize: CGFloat) {
        self.buttonSize = buttonSize
    }
    
    var body: some View {
        VStack {
            switch count {
            case 1:
                Image("3")
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            case 2:
                Image("2")
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            case 3:
                Image("1")
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            default:
                Text("test")
            }
        }
        .onReceive(timer) { value in
            withAnimation(.easeInOut(duration: 0.01)) {
                count = count > 3 ? 1 : count + 1
            }
        }
    }
}

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown(buttonSize: 300)
    }
}
