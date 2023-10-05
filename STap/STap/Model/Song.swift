//
//  Song.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import Foundation

struct Song: Identifiable {
    let id: UUID = UUID()
    let title: String
    let videoId: String
}
