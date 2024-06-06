import Foundation

struct RotationSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        let vel = 0.3
        let time = engine.analytics.data.elapsedTime
        
        entityManager.forEach(Position.self, Rotation.self, Velocity.self) { position, rotation, velocity in
            position.x = (cos(time) * vel) + velocity.maxSpeed
            rotation.z = (cos(time) * vel) + velocity.maxSpeed
        }
    }
}
