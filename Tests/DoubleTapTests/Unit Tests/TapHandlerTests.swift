import SwiftUI
import XCTest
@testable import DoubleTap

final class TapHandlerTests: XCTestCase {

    // MARK: - Variables

    var tapCacheMock: TapCacheMock!
    var tapCacheKeyProviderMock: TapCacheKeyProviderMock!
    var dateFactoryMock: DateFactoryMock!

    var tapHandler: TapHandler!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        tapHandler = TapHandler()

        tapCacheMock = TapCacheMock()
        tapHandler.cache = tapCacheMock

        tapCacheKeyProviderMock = TapCacheKeyProviderMock()
        tapHandler.cacheKeyProvider = tapCacheKeyProviderMock

        dateFactoryMock = DateFactoryMock()
        tapHandler.dateFactory = dateFactoryMock
    }

    // MARK: - Tests

    func testIsDoubleTapWithoutPreviousTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = nil
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithPreviousOutdatedTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -1)
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithPreviousTapIsDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -0.1)
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertTrue(isDoubleTap)
    }

    func testIsDoubleTapUsesCache() {
        tapCacheKeyProviderMock.keyReturnValue = "random-key"
        let date = Date()
        dateFactoryMock.createReturnValue = date
        _ = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertEqual(tapCacheMock.calls, [
            .lastTapDate(key: "random-key"),
            .setTapDate(date: date, key: "random-key")
        ])
        XCTAssertEqual(tapCacheKeyProviderMock.calls, [
            .key
        ])
        XCTAssertEqual(dateFactoryMock.calls, [
            .create
        ])
    }
}
