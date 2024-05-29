import Foundation

struct RenderSystem: System {
    func update(deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        manager.components.fetch(Mesh.self, Position.self, Rotation.self, Scale.self) { mesh, position, rotation, scale in
            guard let mesh, let position, let rotation, let scale else { return }
            
            let node = RenderNode(
                mesh: mesh,
                position: position,
                rotation: rotation,
                scale: scale
            )
            
            nodes.append(node)
        }
        
        manager.output.render?.draw(nodes: nodes)
    }
}
