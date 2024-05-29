import Foundation

protocol Component {}

extension Component {
    static var id: String { String(describing: self) }
    var id: String { Self.id }
}
