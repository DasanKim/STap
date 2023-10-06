//
//  Song.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import Foundation

public protocol Response: Decodable { }

struct GetPlaylistSongsDTO: Response {
    let items: [SongDTO]
}

struct SongDTO: Response {
    let snippet: SongSnippetDTO
}

struct SongSnippetDTO: Response {
    let channelId: String
    let title: String
    let thumbnails: ThumbnailsDTO
    let resourceId: SongResourceDTO
}

struct ThumbnailsDTO: Response {
    let medium: ImageUrlDTO
}

struct ImageUrlDTO: Response {
    let url: URL
}

struct SongResourceDTO: Response {
    let videoId: String
}
