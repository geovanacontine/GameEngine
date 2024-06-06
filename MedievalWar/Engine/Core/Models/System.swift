import Foundation

protocol System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval)
}

extension System {
    var engine: GameEngine { GameEngine.shared }
}
