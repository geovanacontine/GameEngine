import Foundation

struct RenderSystem: System {
    func update(deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        entityManager.forEach(Mesh.self, Position.self, Scale.self, Rotation.self) { mesh, position, scale, rotation in
            nodes.append(
                RenderNode(
                    mesh: mesh,
                    position: position,
                    rotation: rotation,
                    scale: scale
                )
            )
        }
        
        engine.output.render?.draw(nodes: nodes)
    }
}
