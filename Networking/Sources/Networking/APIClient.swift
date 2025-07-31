//
//  APIClient.swift
//  AsyncLetReproducer
//
//  Created by Kiel Gillard on 25/7/2025.
//
import Foundation

public struct APIClient: Sendable {
    
    public init() {
        
    }
    
    public func get<ResponseType: Sendable & Decodable>(_ endpoint: Endpoint, responseType: ResponseType.Type, decoder: JSONDecoder = JSONDecoder()) async throws -> ResponseType {
        try await Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)
            return try decoder.decode(ResponseType.self, from: "{\"id\": 0}".data(using: .utf8)!)
        }.value
    }
}
