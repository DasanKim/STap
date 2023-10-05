//
//  STapButton.swift
//  STap
//
//  Created by STap UP on 2023/10/05.
//

import SwiftUI

struct STapButtonView: View {
    
    let tapAction: () -> Void
    
    init(tapAction: @escaping () -> Void) {
        self.tapAction = tapAction
    }
    
    var body: some View {
        Button {
            tapAction()
        } label: {
            Image("playButton")
                .resizable()
                .frame(width: 320, height: 320)
        }
    }
}

struct STapButton_Previews: PreviewProvider {
    static var previews: some View {
        STapButtonView {
            
        }
    }
}
