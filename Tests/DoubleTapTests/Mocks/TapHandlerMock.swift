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

    var isDoubleTapViewReturnValue: Bool?
    func isDoubleTap<ContentView>(for view: ContentView) -> Bool where ContentView : View {
        calls.append(.isDoubleTap)
        return isDoubleTapViewReturnValue ?? false
    }

    var isDoubleTapReferenceReturnValue: Bool?
    func isDoubleTap<Reference>(for reference: Reference) -> Bool where Reference : Identifiable {
        calls.append(.isDoubleTap)
        return isDoubleTapReferenceReturnValue ?? false
    }
}
