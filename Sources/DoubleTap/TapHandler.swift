import SwiftUI

protocol TapHandlerType {
    func isDoubleTap<Reference: Identifiable>(for reference: Reference) -> Bool
    func isDoubleTap<ContentView: View>(for view: ContentView) -> Bool
}

final class TapHandler: TapHandlerType {

    // MARK: - Dependencies

    var cache: TapCacheType = TapCache()
    var cacheKeyProvider: TapCacheKeyProviderType = TapCacheKeyProvider()
    var dateFactory: DateFactoryType = DateFactory()

    // MARK: - Variables

    static let shared = TapHandler()
    private let doubleTapThreshold: TimeInterval = 0.4

    // MARK: - TapHandlerType

    func isDoubleTap<ContentView: View>(for view: ContentView) -> Bool {
        let key = cacheKeyProvider.key(for: view)
        let date = registerTapAndReturnPreviousTap(for: key)
        return isDoubleTap(for: date)
    }

    func isDoubleTap<Reference: Identifiable>(for reference: Reference) -> Bool {
        let key = cacheKeyProvider.key(for: reference)
        let date = registerTapAndReturnPreviousTap(for: key)
        return isDoubleTap(for: date)
    }

    // MARK: - Private

    private func registerTapAndReturnPreviousTap(for key: String) -> Date? {
        let date = cache.lastTapDate(for: key)
        let nowDate = dateFactory.create()
        cache.setTapDate(nowDate, for: key)
        return date
    }

    private func isDoubleTap(for date: Date?) -> Bool {
        if let date = date, date.timeIntervalSince1970 >= Date().timeIntervalSince1970 - doubleTapThreshold {
            return true
        } else {
            return false
        }
    }
}
