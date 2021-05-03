import Foundation

protocol DateFactoryType {
    func create() -> Date
}

final class DateFactory: DateFactoryType {

    func create() -> Date {
        Date()
    }
}
