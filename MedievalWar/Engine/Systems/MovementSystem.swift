import Foundation

struct MovementSystem: System {
    func update(deltaTime: TimeInterval) {
        entityManager.forEach(Velocity.self, Position.self) { velocity, position in
            let nextX = position.x + velocity.x * deltaTime
            let nextY = position.y - velocity.y * deltaTime
            
            position.x = nextX
            position.y = nextY
        }
    }
}
