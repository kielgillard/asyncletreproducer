//
//  ContentView.swift
//  AsyncLetReproducer
//
//  Created by Kiel Gillard on 25/7/2025.
//

import SwiftUI
import Feature
import FeatureLiveDependencies
import Networking

struct ContentView: View {
    
    let featureDependencies = FeatureDependencies(apiClient: APIClient())
    
    @State var done = false
    
    var body: some View {
        Text(done ? "Goodbye" : "Hello")
            .task { @MainActor in 
                do {
                    let thing = try await featureDependencies.getThing()
                    print(thing)
                    done = true
                } catch {
                    print(String(reflecting: error))
                }
            }
    }
}
