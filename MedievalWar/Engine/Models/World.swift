import Foundation

struct World {
    
    // Settings
    var mapWidth: Double
    var mapHeight: Double
    
    // Components
    var positionList: [PositionComponent?] = []
    var bodyList: [BodyComponent?] = []
    var velocityList: [VelocityComponent?] = []
    
}

extension World {
    mutating func spawn(_ prefab: Prefab) {
        positionList.append(prefab.position)
        bodyList.append(prefab.body)
        velocityList.append(prefab.velocity)
    }
    
    mutating func destroy(id: Int) {
        positionList.remove(at: id)
        bodyList.remove(at: id)
        velocityList.remove(at: id)
    }
}
