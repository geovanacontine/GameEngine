import Foundation

struct InputSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        guard let inputDevice = engine.input.device else { return }
        
        let xAxis = inputDevice.xAxis
        let yAxis = inputDevice.yAxis
        
        // Normalize inputs
        let inputMagnitude = sqrt((xAxis * xAxis) + (yAxis * yAxis))
        let normalizedX = xAxis / inputMagnitude
        let normalizedY = yAxis / inputMagnitude
        
        entityManager.forEach(Velocity.self) { velocity in
            if abs(xAxis) == abs(yAxis), xAxis != 0 {
                velocity.x = normalizedX * velocity.maxSpeed
                velocity.y = normalizedY * velocity.maxSpeed
            } else {
                velocity.x = xAxis * velocity.maxSpeed
                velocity.y = yAxis * velocity.maxSpeed
            }
        }
    }
}
