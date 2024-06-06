import Foundation

class RotationSystem: System {
    
    var time = 0.0
    var vel = 0.3
    
    func update(deltaTime: TimeInterval) {
        
        time += deltaTime
        
        entityManager.forEach(Position.self, Rotation.self, Velocity.self) { position, rotation, velocity in
            position.x = (cos(time) * vel) + velocity.maxSpeed
            rotation.z = (cos(time) * vel) + velocity.maxSpeed
        }
    }
}
