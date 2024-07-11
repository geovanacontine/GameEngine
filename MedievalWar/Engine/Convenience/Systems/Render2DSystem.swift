import Foundation

struct Render2DSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        entityManager.forEach(
            Color.self, Mesh.self, Position.self, Scale.self, Rotation.self
        ) { color, mesh, position, scale, rotation in
            nodes.append(
                RenderNode(
                    color: color,
                    mesh: mesh,
                    position: position,
                    rotation: rotation,
                    scale: scale
                )
            )
        }
        
        entityManager.forEach(
            Sprite.self, Mesh.self, Position.self, Scale.self, Rotation.self
        ) { sprite, mesh, position, scale, rotation in
            nodes.append(
                RenderNode(
                    sprite: sprite,
                    mesh: mesh,
                    position: position,
                    rotation: rotation,
                    scale: scale
                )
            )
        }
        
        entityManager.forEach(
            Outline.self, Mesh.self, Position.self, Scale.self, Rotation.self
        ) { outline, mesh, position, scale, rotation in
            nodes.append(
                RenderNode(
                    outline: outline,
                    mesh: mesh,
                    position: .init(x: position.x, y: position.y, z: position.z + 0.001),
                    rotation: rotation,
                    scale: scale
                )
            )
        }
        
        engine.output.render?.draw(nodes: nodes)
    }
}
