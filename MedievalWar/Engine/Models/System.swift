import Foundation

protocol System {
    var manager: GameManager { get }
    func update(deltaTime: TimeInterval)
}

extension System {
    var manager: GameManager { GameManager.shared }
}
