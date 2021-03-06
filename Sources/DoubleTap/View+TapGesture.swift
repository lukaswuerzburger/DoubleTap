import SwiftUI

public extension View {

    func onTapGesture(
        firstTap: @escaping () -> Void,
        secondTap: @escaping () -> Void
    ) -> some View {
        onTapGesture(count: 1) {
            if TapHandlerTypeResolver.handler.isDoubleTap(for: self) {
                secondTap()
            } else {
                firstTap()
            }
        }
    }

    func onTapGesture<Reference: Identifiable>(
        identifiedBy reference: Reference,
        firstTap: @escaping () -> Void,
        secondTap: @escaping () -> Void
    ) -> some View {
        onTapGesture(count: 1) {
            if TapHandlerTypeResolver.handler.isDoubleTap(for: reference) {
                secondTap()
            } else {
                firstTap()
            }
        }
    }
}
