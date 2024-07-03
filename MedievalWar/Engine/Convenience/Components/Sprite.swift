import Foundation

struct Sprite: Component {
    
    var meshType: MeshType
    var name: String
    
    init(named name: String, meshType: MeshType = .square) {
        self.meshType = meshType
        self.name = name
    }
}
