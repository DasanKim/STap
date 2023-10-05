//
//  HeaderView.swift
//  STap
//
//  Created by 이호영 on 2023/10/06.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("STap")
                    .font(Font.system(size: 28, weight: .semibold))
                    .padding(.leading, 20)
                    .padding(.top, 20)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
