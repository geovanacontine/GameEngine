import Foundation

struct MovementSystem: System {
    func update(world: inout World, deltaTime: TimeInterval) {
        for index in world.velocityList.allElements {
            
            // Requirements
            guard let velocity = world.velocityList[index] else { continue }
            guard let transform = world.transformList[index] else { continue }
//            guard let body = world.bodyList[index] else { continue }
            
            let nextX = transform.position.x + velocity.x * Float(deltaTime)
            let nextY = transform.position.y - velocity.y * Float(deltaTime)
            
//            let validXRange = 0...(world.mapWidth - body.width)
//            let validYRange = 0...(world.mapHeight - body.height)
            
//            let validXRange = 0...(world.mapWidth)
//            let validYRange = 0...(world.mapHeight)
//            Float
//            if validXRange.contains(nextX) {
//                world.positionList[index]?.x = nextX
//            }
//            
//            if validYRange.contains(nextY) {
//                world.positionList[index]?.y = nextY
//            }
            
            world.transformList[index]?.position.x = nextX
            world.transformList[index]?.position.y = nextY
        }
    }
}
