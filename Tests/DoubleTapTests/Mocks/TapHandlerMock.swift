import SwiftUI
@testable import DoubleTap

final class TapHandlerMock: TapHandlerType {

    // MARK: - Calls

    enum Call: Equatable {
        case isDoubleTap
    }
    var calls: [Call] = []

    // MARK: - Initialization

    static let shared = TapHandlerMock()

    // MARK: - TapHandlerType

    var isDoubleTapReturnValue: Bool?
    func isDoubleTap<Content>(for view: Content) -> Bool where Content : View {
        calls.append(.isDoubleTap)
        return isDoubleTapReturnValue ?? false
    }
}
