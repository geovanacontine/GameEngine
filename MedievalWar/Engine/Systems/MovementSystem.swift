import Foundation

struct MovementSystem: System {
    
    func update(deltaTime: TimeInterval) {
        manager.components.fetch(Position.self, Velocity.self) { position, velocity in
            
            guard let vel = velocity else { return }
            guard let pos = position else { return }
            
            let nextX = pos.x + vel.x * deltaTime
            let nextY = pos.y - vel.y * deltaTime
            
            position?.x = nextX
            position?.y = nextY
        }
    }
}
