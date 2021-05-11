import SwiftUI
import XCTest
@testable import DoubleTap

class TapHandlerTests: XCTestCase {

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

    // MARK: - Tests (View)

    func testIsDoubleTapWithViewWithoutPreviousTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = nil
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithViewWithPreviousOutdatedTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -1)
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithViewWithPreviousTapIsDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -0.1)
        let isDoubleTap = tapHandler.isDoubleTap(for: Rectangle())
        XCTAssertTrue(isDoubleTap)
    }

    func testIsDoubleTapWithViewUsesCache() {
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

    // MARK: - Tests (Reference)

    func testIsDoubleTapWithReferenceWithoutPreviousTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = nil
        let isDoubleTap = tapHandler.isDoubleTap(for: ReferenceMock())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithReferenceWithPreviousOutdatedTapIsNoDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -1)
        let isDoubleTap = tapHandler.isDoubleTap(for: ReferenceMock())
        XCTAssertFalse(isDoubleTap)
    }

    func testIsDoubleTapWithReferenceWithPreviousTapIsDoubleTap() {
        tapCacheMock.lastTapDateReturnValue = Date(timeIntervalSinceNow: -0.1)
        let isDoubleTap = tapHandler.isDoubleTap(for: ReferenceMock())
        XCTAssertTrue(isDoubleTap)
    }

    func testIsDoubleTapWithReferenceUsesCache() {
        tapCacheKeyProviderMock.keyReturnValue = "random-key"
        let date = Date()
        dateFactoryMock.createReturnValue = date
        _ = tapHandler.isDoubleTap(for: ReferenceMock())
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
