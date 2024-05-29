import Foundation

class InputSystem: System {
    func update(deltaTime: TimeInterval) {
        
        guard let inputDevice = manager.input.device else { return }
        
        let xAxis = inputDevice.xAxis
        let yAxis = inputDevice.yAxis
        
        // Normalize inputs
        let inputMagnitude = sqrt((xAxis * xAxis) + (yAxis * yAxis))
        let normalizedX = xAxis / inputMagnitude
        let normalizedY = yAxis / inputMagnitude
        
        manager.components.fetch(Velocity.self) { velocity in
            
            guard let vel = velocity else { return }
            
            // Handle diagonal movements
            if abs(xAxis) == abs(yAxis), xAxis != 0 {
                velocity?.x = normalizedX * vel.maxSpeed
                velocity?.y = normalizedY * vel.maxSpeed
            } else {
                velocity?.x = xAxis * vel.maxSpeed
                velocity?.y = yAxis * vel.maxSpeed
            }
        }
    }
}
