import SwiftUI

extension Binding {
    public func isActive<Wrapped>() -> Binding<Bool>
    where Value == Wrapped? {
        .init(
            get: { self.wrappedValue != nil },
            set: { isPresent, transaction in
                if !isPresent {
                    self.transaction(transaction).wrappedValue = nil
                }
            }
        )
    }
    
    public func isActive<Wrapped: Equatable>(_ value: Wrapped) -> Binding<Bool> where Value == Wrapped? {
        .init(
            get: { self.wrappedValue == value },
            set: { isPresent, transaction in
                self.transaction(transaction).wrappedValue = isPresent ? value : nil
            }
        )
    }
}
