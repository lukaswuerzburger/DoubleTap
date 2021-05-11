import XCTest
import SwiftUI
import ViewInspector
@testable import DoubleTap

class ViewExtensionTests: XCTestCase {

    // MARK: - Tests (View)

    func testSingleTap() throws {
        var firstTapCount = 0
        var secondTapCound = 0
        let view = Circle()
            .onTapGesture {
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 0)
    }

    func testDoubleTap() throws {
        var firstTapCount = 0
        var secondTapCound = 0
        let view = Rectangle()
            .onTapGesture {
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 1)
    }

    func testDoubleTapWithChangingView() throws {
        var test: Bool = true
        var firstTapCount = 0
        var secondTapCound = 0
        let view = Text("")
            .background(test ? Color.green : Color.blue)
            .onTapGesture {
                test.toggle()
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 1)
    }

    // MARK: - Tests (Reference)

    func testSingleTapWithReference() throws {
        var firstTapCount = 0
        var secondTapCound = 0
        let obj = ReferenceMock()
        let view = Circle()
            .onTapGesture(identifiedBy: obj) {
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 0)
    }

    func testDoubleTapWithReference() throws {
        var firstTapCount = 0
        var secondTapCound = 0
        let obj = ReferenceMock()
        let view = Rectangle()
            .onTapGesture(identifiedBy: obj) {
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 1)
    }

    func testDoubleTapWithChangingViewWithReference() throws {
        var test: Bool = true
        var firstTapCount = 0
        var secondTapCound = 0
        let obj = ReferenceMock()
        let view = Text("")
            .background(test ? Color.green : Color.blue)
            .onTapGesture(identifiedBy: obj) {
                test.toggle()
                firstTapCount += 1
            } secondTap: {
                secondTapCound += 1
            }
        try view.inspect().callOnTapGesture()
        try view.inspect().callOnTapGesture()
        XCTAssertEqual(firstTapCount, 1)
        XCTAssertEqual(secondTapCound, 1)
    }
}
