//
//  suspendingRectangle.swift
//  STap
//
//  Created by Yena on 2023/10/06.
//

import SwiftUI

struct suspendingRectangle: View {
    let title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .frame(width: 200, height: 90)
            .shadow(radius: 3)
            .overlay {
                Text(title)
                    .font(Font.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("purple"))
                    .padding(.vertical, 19)
            }
    }
}

struct suspendingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        suspendingRectangle(title: "다시 시작")
    }
}
