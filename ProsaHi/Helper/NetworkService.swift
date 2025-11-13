//
//  NetworkService.swift
//  ProsaHi
//
//  Created by фкшуа on 09/11/25.
//

import Foundation

//protocol NetworkServiceProtocol {
//    func get<T: Decodable>(_ path: String, responseType: T.Type) async throws
//        -> T
//    func post<T: Decodable, Body: Encodable>(
//        _ path: String,
//        body: Body,
//        responseType: T.Type
//    ) async throws -> T
//}

class NetworkService {

    private let baseURL = "https://master.prosahi.my.id/api"
    private let enableLogging = true

    // MARK: - Generic GET Request
    func get<T: Decodable>(_ path: String, responseType: T.Type) async throws
        -> T
    {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw CustomError.generalError("Invalid Url")
        }

        let start = Date()
        logRequest(method: "GET", url: url)

        let (data, response) = try await URLSession.shared.data(from: url)

        let duration = Date().timeIntervalSince(start)
        try logResponse(response, data: data, duration: duration)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CustomError.generalError("Response null")
        }

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
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw CustomError.generalError("Invalid url")
        }
        
        let start = Date()
        logRequest(method: "POST", url: url, body: body)

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
        
        let duration = Date().timeIntervalSince(start)
        try logResponse(response, data: data, duration: duration)

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

    // MARK: - Private Helpers
    private func decode<T: Decodable>(_ data: Data, as type: T.Type) throws -> T
    {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw CustomError.generalError(
                "Invalid response with provided response model")
        }
    }

    private func logRequest<Body: Encodable>(
        method: String, url: URL, body: Body?
    ) {
        guard enableLogging else { return }
        print("📤 [Request] \(method): \(url.absoluteString)")

        if let body = body {
            if let jsonData = try? JSONEncoder().encode(body),
                let jsonString = String(data: jsonData, encoding: .utf8)
            {
                print("➡️ Body: \(jsonString)")
            }
        }
    }
    
    private func logRequest(
        method: String, url: URL
    ) {
        guard enableLogging else { return }
        print("📤 [Request] \(method): \(url.absoluteString)")
    }

    private func logResponse(
        _ response: URLResponse, data: Data, duration: TimeInterval
    ) throws {
        guard enableLogging else { return }

        guard let httpResponse = response as? HTTPURLResponse else {
            print("❌ [Response] Invalid HTTPURLResponse")
            return
        }

        print(
            "📥 [Response] \(httpResponse.statusCode) (\(String(format: "%.2fs", duration)))"
        )
        print("🔗 URL: \(httpResponse.url?.absoluteString ?? "-")")

        if let jsonString = String(data: data, encoding: .utf8) {
            print("📦 Body: \(jsonString)")
        } else {
            print("📦 Body: <non-UTF8 data>")
        }
    }
}
