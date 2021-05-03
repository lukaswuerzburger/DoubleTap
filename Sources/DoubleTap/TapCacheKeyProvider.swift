import Foundation

protocol TapCacheKeyProviderType {
    func key(for object: Any) -> String
}

final class TapCacheKeyProvider: TapCacheKeyProviderType {

    func key(for object: Any) -> String {
        return "\(object)"
    }
}
