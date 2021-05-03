import Foundation
@testable import DoubleTap

class DateFactoryMock: DateFactoryType {

    // MARK: - Calls

    enum Call: Equatable {
        case create
    }
    var calls: [Call] = []

    // MARK: - DateFactoryType

    var createReturnValue: Date?
    func create() -> Date {
        calls.append(.create)
        return createReturnValue ?? Date()
    }
}
