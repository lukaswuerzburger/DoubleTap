import Foundation

protocol TapCacheKeyProviderType {
    func key(for object: Any) -> String
}

final class TapCacheKeyProvider: TapCacheKeyProviderType {

    func key(for object: Any) -> String {
        var key: String = "\(object)"
        withUnsafePointer(to: object) { pointer in
            key = "\(pointer)"
        }
        return key
    }
}
