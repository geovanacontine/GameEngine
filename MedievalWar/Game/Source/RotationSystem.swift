import Foundation

struct RotationSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        let time = engine.analytics.data.elapsedTime
        
//        entityManager.forEach(Position.self, Rotation.self, Velocity.self) { position, rotation, velocity in
//            rotation.y = 2 * cos(time) + velocity.maxSpeed
//        }
    }
}
