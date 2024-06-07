import Foundation

class RenderNode: Node {
    
    let mesh: Mesh
    
    init(
        mesh: Mesh,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.mesh = mesh
        super.init(position: position, rotation: rotation, scale: scale)
    }
}
