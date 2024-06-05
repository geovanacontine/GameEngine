import Foundation

protocol System {
    func update(deltaTime: TimeInterval)
}

extension System {
    var engine: GameEngine { GameEngine.shared }
    var entityManager: EntityManager { engine.entityManager }
}
