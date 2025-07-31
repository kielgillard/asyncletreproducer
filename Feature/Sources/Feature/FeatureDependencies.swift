// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct FeatureDependencies {
    var getThingOperation: () async throws -> Thing
    
    public init(getThingOperation: @escaping () async throws -> Thing) {
        self.getThingOperation = getThingOperation
    }
    
    public func getThing() async throws -> Thing {
        try await getThingOperation()
    }
}
