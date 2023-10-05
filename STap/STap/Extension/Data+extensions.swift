//
//  Data+extensions.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import Foundation

extension Data {
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try jsonDecoder.decode(type, from: self)
            return data
        } catch {
            throw NetworkError.decode
        }
    }
}

enum NetworkError: Error {
    case decode
}
