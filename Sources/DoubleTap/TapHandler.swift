import SwiftUI

protocol TapHandlerType {
    static var shared: Self { get }
    func isDoubleTap<Content: View>(for view: Content) -> Bool
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

    func isDoubleTap<Content: View>(for view: Content) -> Bool {
        let date = registerTapAndReturnPreviousTap(for: view)
        return isDoubleTap(for: date)
    }

    // MARK: - Private

    private func registerTapAndReturnPreviousTap<Content: View>(for view: Content) -> Date? {
        let key = cacheKeyProvider.key(for: view)
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
