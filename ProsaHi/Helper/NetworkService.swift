//
//  NetworkService.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import Foundation

final class NetworkService {

    //    private let baseURL: String
    //
    //    init(baseURL: String) {
    //        self.baseURL = baseURL
    //    }

    private let baseURL = "https://api.github.com/users"

    // MARK: - Generic GET Request
    func get<T: Decodable>(_ path: String, responseType: T.Type) async throws
        -> T
    {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw CustomError.generalError("Invalid Url")
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CustomError.generalError("Response null")
        }

//        guard let string = String(data: data, encoding: .utf8) else {
//            throw URLError(.cannotDecodeRawData)
//        }
//
//        print("data: \(string)")

        guard (200...299).contains(httpResponse.statusCode) else {
            throw CustomError.generalError("Error Response")
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw CustomError.generalError("Invalid response with the model")
        }
    }

    // MARK: - Generic POST Request
    func post<T: Decodable, Body: Encodable>(
        _ path: String,
        body: Body,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: "\(baseURL)/\(path)") else {
            throw CustomError.generalError("Invalid url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            throw CustomError.generalError(
                "Invalid request with the body model")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CustomError.generalError("null response")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw CustomError.generalError("Error response")
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw CustomError.generalError(
                "Invalid response with provided response model")
        }
    }
}
