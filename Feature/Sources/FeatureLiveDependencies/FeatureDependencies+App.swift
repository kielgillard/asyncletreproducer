import Foundation
import Networking
import Feature

extension FeatureDependencies {
    
    public init(apiClient: APIClient) {
        self.init(getThingOperation: {
            try await FeatureLiveDependencies.getThingOperation(apiClient: apiClient)
        })
    }
}

func getThingOperation(apiClient: APIClient) async throws -> Thing {
    async let responseAsync = apiClient.get(.specific(.full), responseType: ResponseObject.self)
    async let anotherResponseAsync = apiClient.get(.specific(.that), responseType: ResponseObject.self)
    
    let (response, anotherResponse) = try! await (responseAsync, anotherResponseAsync)
    
    var thing = Thing(id: 86)
    
    thing.id = max(response.id, anotherResponse.id)
    // Jamie: 💥💥💥💥💥💥💥 //
    return thing
}
