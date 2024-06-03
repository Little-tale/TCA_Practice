//
//  TEST.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture
import Foundation

struct NumbersAPIClient {
    enum Category: String {
        case trivia, math, date, year
    }
    
    var request: (Category) async throws -> String
}

extension NumbersAPIClient {
    static let live = NumbersAPIClient(request: { category in
        let url = URL(string: "http://numbersapi.com/random/\(category.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        return String(data: data, encoding: .utf8)!
    })
}

struct NumbersAPIClientKey: DependencyKey {
    static let liveValue = NumbersAPIClient.live
//    static let previewValue = NumbersAPIClient.live
//    static let testValue = NumbersAPIClient(request: { _ in "Test response" })
}

extension DependencyValues {
    var numbersAPIClient: NumbersAPIClient {
        get { self[NumbersAPIClientKey.self] }
        set { self[NumbersAPIClientKey.self] = newValue }
    }
}
