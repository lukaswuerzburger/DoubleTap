import XCTest
import SwiftUI
import ViewInspector
@testable import DoubleTap

final class ViewExtensionTests: XCTestCase {

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
}
