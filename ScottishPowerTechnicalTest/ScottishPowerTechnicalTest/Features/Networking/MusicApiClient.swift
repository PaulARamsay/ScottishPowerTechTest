//
//  MusicApiClient.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

protocol MusicApiClient {
    func rockTrackList(completion: @escaping (NetworkRequestResult<[TracksListResponse.Track]>) -> Void)
}

enum NetworkRequestResult<T: Decodable> {
    case success(T)
    case failure(reason: FailureReason)
}

enum FailureReason {
    case decodeFailure
    case networkRequestFailure
}

class MusicClient: MusicApiClient {
    
    func rockTrackList(completion: @escaping (NetworkRequestResult<[TracksListResponse.Track]>) -> Void) {

        let task = URLSession.shared.dataTask(with: .init(url: Endpoints.rockTrackList)) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do {
                        let model = try decoder.decode(TracksListResponse.self, from: data)
                        completion(.success(model.results))
                    } catch {
                        completion(.failure(reason: .decodeFailure))
                    }
                    
                } else {
                    completion(.failure(reason: .networkRequestFailure))
                }
            }
        }
        
        task.resume()
    }
}

enum Endpoints {
    static let rockTrackList = URL(string: "https://itunes.apple.com/search?term=rock")!
}
