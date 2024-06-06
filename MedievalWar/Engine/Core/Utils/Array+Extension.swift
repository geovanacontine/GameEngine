import Foundation

extension Array {
    var allElements: Range<Int> {
        0..<self.count
    }
}

extension Array where Element == any Component.Type {
    func isEqual(to componentTypes: [any Component.Type]) -> Bool {
        guard count == componentTypes.count else { return false }
        return allSatisfy { componentType in
            componentTypes.contains(where: { $0.id == componentType.id })
        }
    }
}

extension Array where Element == any Component {
    var types: [any Component.Type] {
        map({ type(of: $0) })
    }
}
