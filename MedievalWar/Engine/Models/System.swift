import Foundation

protocol System {
    func update(
        world: inout World,
        input: inout GameInput?,
        deltaTime: TimeInterval
    )
}
