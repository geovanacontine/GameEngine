import Foundation

struct InputSystem: System {
    func update(world: inout World, input: inout GameInput?, deltaTime: TimeInterval) {
        
        guard let input else { return }
        
        let xAxis = input.xAxis
        let yAxis = input.yAxis
        
        // Normalize inputs
        let inputMagnitude = sqrt((xAxis * xAxis) + (yAxis * yAxis))
        let normalizedX = xAxis / inputMagnitude
        let normalizedY = yAxis / inputMagnitude
        
        for index in world.velocityList.allElements {
            
            // Requirements
            guard let velocity = world.velocityList[index] else { continue }
            
            // Handle diagonal movements
            if abs(xAxis) == abs(yAxis), xAxis != 0 {
                world.velocityList[index]?.x = normalizedX * velocity.maxSpeed
                world.velocityList[index]?.y = normalizedY * velocity.maxSpeed
            } else {
                world.velocityList[index]?.x = xAxis * velocity.maxSpeed
                world.velocityList[index]?.y = yAxis * velocity.maxSpeed
            }
        }
    }
}
