import Foundation

struct PhysicsSystem: System {
    func update(deltaTime: TimeInterval) {
        
//        let entities: [BVHEntity] = world.bodyList.enumerated().compactMap { index, body in
//            guard let body else { return nil }
//            guard let position = world.positionList[index] else { return nil }
//            guard let velocity = world.velocityList[index] else { return nil }
//            
//            return BVHEntity(
//                id: index,
//                x: position.x + velocity.x,
//                y: position.y + velocity.y,
//                width: body.width,
//                height: body.height
//            )
//        }
//        
//        let bvh = BVH(entities: entities, maxEntities: 2)
//        
//        for leaf in bvh.collisionCheckLeaves {
//            if isColliding(entityA: leaf.entityA, entityB: leaf.entityB) {
//                
//                let indexA = leaf.entityA.id
//                world.velocityList[indexA]?.x = 0
//                world.velocityList[indexA]?.y = 0
//                
//                let indexB = leaf.entityB.id
//                world.velocityList[indexB]?.x = 0
//                world.velocityList[indexB]?.y = 0
//            }
//        }
    }
    
    private func isColliding(entityA: BVHEntity, entityB: BVHEntity) -> Bool {
        let bodyA = AABB(x: entityA.x, y: entityA.y, width: entityA.width, height: entityA.height)
        let bodyB = AABB(x: entityB.x, y: entityB.y, width: entityB.width, height: entityB.height)
        return bodyA.intersects(bodyB)
    }
}
