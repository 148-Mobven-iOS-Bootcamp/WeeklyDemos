//
//  NetworkService.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func get<T: Decodable>(from endpoint: String, completion: @escaping (T?, NetworkError?) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case custom(String?)
    case decoding(String?)
    case noData
}

class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://rss.applemarketingtools.com/api/v2/us/podcasts/top/50/"

    func get<T: Decodable>(from endpoint: String, completion: @escaping (T?, NetworkError?) -> Void) {
        guard let url = URL(string: baseURL + endpoint + ".json") else {
            completion(nil, NetworkError.invalidURL)
            return
        }

        createDataTask(from: url, completion: completion).resume()
    }

    private func createDataTask<T: Decodable>(from url: URL, completion: @escaping (T?, NetworkError?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard error == nil else {
                completion(nil, NetworkError.custom(error?.localizedDescription))
                return
            }

            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
//            switch (urlResponse as HTTPURLResponse).statusCode { }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, NetworkError.decoding(error.localizedDescription))
            }
        }
    }
}
