import Foundation

struct World {
    
    // Settings
    var mapWidth: Double
    var mapHeight: Double
    
    // Components
    var transformList: [TransformComponent?] = []
    var meshList: [MeshComponent?] = []
    var bodyList: [BodyComponent?] = []
    var velocityList: [VelocityComponent?] = []
}

extension World {
    mutating func spawn(_ prefab: Prefab) {
        transformList.append(prefab.transform)
        meshList.append(prefab.mesh)
        bodyList.append(prefab.body)
        velocityList.append(prefab.velocity)
    }
    
    mutating func destroy(id: Int) {
        transformList.remove(at: id)
        meshList.remove(at: id)
        bodyList.remove(at: id)
        velocityList.remove(at: id)
    }
}
