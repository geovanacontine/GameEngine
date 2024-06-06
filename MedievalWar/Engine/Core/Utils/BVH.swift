import Foundation

struct CollisionCheckLeaf {
    let entityA: BVHEntity
    let entityB: BVHEntity
}

struct BVHEntity {
    let id: Int
    let x: Double
    let y: Double
    let width: Double
    let height: Double
}

// BoundaryVolumeHierarchy
class BVH {
    
    let root: BVHNode
    
    init(entities: [BVHEntity], maxEntities: Int) {
        self.root = .init(entities: entities, maxEntities: maxEntities)
    }
    
    var allNodes: [BVHNode] {
        [root] + root.allChildren
    }
    
    var leaves: [BVHNode] {
        allNodes.filter({ $0.isLeaf })
    }
    
    var collisionCheckLeaves: [CollisionCheckLeaf] {
        let validLeaves = leaves.filter({ $0.entities.count == 2 })
        
        return validLeaves.map({
            CollisionCheckLeaf(
                entityA: $0.entities[0],
                entityB: $0.entities[1]
            )
        })
    }
}

class BVHNode {
    
    let aabb: AABB
    let maxEntities: Int
    
    var children: [BVHNode]
    var entities: [BVHEntity]
    
    var isLeaf: Bool { children.isEmpty }
    var allChildren: [BVHNode] { children + children.flatMap({ $0.allChildren }) }
    
    init(entities: [BVHEntity], maxEntities: Int) {
        let aabbs = entities.map({ AABB(x: $0.x, y: $0.y, width: $0.width, height: $0.height) })
        self.aabb = .init(containing: aabbs)
        self.maxEntities = maxEntities
        self.entities = []
        self.children = []
        
        if entities.count > maxEntities {
            createChildren(entities: entities)
        } else {
            self.entities = entities
        }
    }
}

extension BVHNode {
    private func createChildren(entities: [BVHEntity]) {
        let aabbs = entities.map({ AABB(x: $0.x, y: $0.y, width: $0.width, height: $0.height) })
        let (firstHalf, lastHalf) = divideByLongestAxis(aabbs: aabbs)
        
        let firstHalfEntities = Array(entities[0..<firstHalf.count])
        let lastHalfEntities = Array(entities[firstHalf.count..<entities.count])
        
        if !firstHalfEntities.isEmpty {
            let newNode = BVHNode(entities: firstHalfEntities, maxEntities: maxEntities)
            children.append(newNode)
        }
        
        if !lastHalfEntities.isEmpty {
            let newNode = BVHNode(entities: lastHalfEntities, maxEntities: maxEntities)
            children.append(newNode)
        }
    }
    
    private func divideByLongestAxis(aabbs: [AABB]) -> (firstHalf: [AABB], lastHalf: [AABB]) {
        if aabb.width >= aabb.height {
            let sorted = aabbs.sorted(by: { $0.center.x < $1.center.x })
            let firstHalf = sorted.filter({ $0.maxX < aabb.center.x })
            let lastHalf = sorted.filter({ $0.maxX >= aabb.center.x })
            return (firstHalf, lastHalf)
        } else {
            let sorted = aabbs.sorted(by: { $0.center.y < $1.center.y })
            let firstHalf = sorted.filter({ $0.maxY < aabb.center.y })
            let lastHalf = sorted.filter({ $0.maxY >= aabb.center.y })
            return (firstHalf, lastHalf)
        }
    }
}
