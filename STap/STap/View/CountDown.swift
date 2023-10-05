//
//  CountDown.swift
//  STap
//
//  Created by Yena on 2023/10/05.
//

import SwiftUI

struct CountDownView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var count: Int = 1
    private let buttonSize: CGFloat = 320
    
    let completion: () -> Void
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
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
                Color.clear
            }
        }
        .onReceive(timer) { value in
            withAnimation(.easeInOut(duration: 0.01)) {
                if count == 3 {
                    cancelTimer()
                    completion()
                    count = 1
                } else {
                    count += 1
                }
            }
        }
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
}

struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView {
            
        }
    }
}
