import Foundation

struct MovementSystem: System {
    func update(world: inout World, input: inout GameInput?, deltaTime: TimeInterval) {
        for index in world.velocityList.allElements {
            
            // Requirements
            guard let velocity = world.velocityList[index] else { continue }
            guard let position = world.positionList[index] else { continue }
            guard let body = world.bodyList[index] else { continue }
            
            let nextX = position.x + velocity.x * deltaTime
            let nextY = position.y + velocity.y * deltaTime
            
            let validXRange = 0...(world.mapWidth - body.width)
            let validYRange = 0...(world.mapHeight - body.height)
            
            if validXRange.contains(nextX) {
                world.positionList[index]?.x = nextX
            }
            
            if validYRange.contains(nextY) {
                world.positionList[index]?.y = nextY
            }
        }
    }
}
