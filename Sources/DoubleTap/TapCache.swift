import Foundation

protocol TapCacheType: AnyObject {
    func lastTapDate(for key: String) -> Date?
    func setTapDate(_ date: Date, for key: String)
}

class TapCache: TapCacheType {

    // MARK: - Variables

    private var taps: [String : Date] = [:]

    // MARK: - TapCacheType

    func lastTapDate(for key: String) -> Date? {
        taps[key]
    }

    func setTapDate(_ date: Date, for key: String) {
        taps[key] = date
    }
}
