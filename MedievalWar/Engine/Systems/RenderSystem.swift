import Foundation

struct RenderSystem: System {
    func update(deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        entityManager.forEach(Mesh.self, Position.self) { mesh, position in
            nodes.append(
                RenderNode(
                    mesh: mesh,
                    position: position,
                    rotation: .init(x: 0, y: 0, z: 0),
                    scale: .init(x: 0, y: 0, z: 0)
                )
            )
        }
        
        engine.output.render?.draw(nodes: nodes)
    }
}
