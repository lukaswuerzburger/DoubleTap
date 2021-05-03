@testable import DoubleTap

class TapCacheKeyProviderMock: TapCacheKeyProviderType {

    // MARK: - Calls

    enum Call: Equatable {
        case key
    }
    var calls: [Call] = []

    // MARK: - TapCacheKeyProviderType

    var keyReturnValue: String?
    func key(for object: Any) -> String {
        calls.append(.key)
        return keyReturnValue ?? "key"
    }
}
