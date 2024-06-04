import Foundation

protocol Component: Equatable {}

extension Component {
    static var id: String { String(describing: self) }
    var id: String { Self.id }
}
