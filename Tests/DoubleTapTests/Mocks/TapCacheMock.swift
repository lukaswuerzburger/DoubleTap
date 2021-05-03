import Foundation
@testable import DoubleTap

class TapCacheMock: TapCacheType {

    // MARK: - Calls

    enum Call: Equatable {
        case lastTapDate(key: String)
        case setTapDate(date: Date, key: String)
    }
    var calls: [Call] = []

    // MARK: - TapCacheType

    var lastTapDateReturnValue: Date?
    func lastTapDate(for key: String) -> Date? {
        calls.append(.lastTapDate(key: key))
        return lastTapDateReturnValue
    }

    func setTapDate(_ date: Date, for key: String) {
        calls.append(.setTapDate(date: date, key: key))
    }
}
