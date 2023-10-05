//
//  YoutubeAPI.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import Foundation
import Moya

let youtubeProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum GitHub {
    case playlist(String)
}

extension GitHub: TargetType {
    
    public var key: String { "AIzaSyCnzeWQ1s4skwvUuIiwn2N7OtNP6gyVML0" }
    public var baseURL: URL { URL(string: "https://www.googleapis.com/youtube/v3")! }
    public var path: String {
        switch self {
        case .playlist:
            return "/playlistItems"
        }
    }
    public var method: Moya.Method { .get }

    public var task: Task {
        switch self {
        case .playlist(let param):
            return .requestParameters(
                parameters: [
                    "part": "snippet",
                    "maxResults": "50",
                    "playlistId": param,
                    "key": key
                ],
                encoding: URLEncoding.default
            )
        }
    }
    public var validationType: ValidationType {
        switch self {
        default:
            return .none
        }
    }

    public var headers: [String: String]? { nil }

}

public func url(_ route: TargetType) -> String {
    route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

