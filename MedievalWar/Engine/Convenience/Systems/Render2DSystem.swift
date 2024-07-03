import Foundation

struct Render2DSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        entityManager.forEach(Sprite.self, Position.self, Scale.self, Rotation.self) { sprite, position, scale, rotation in
            nodes.append(
                RenderNode(
                    sprite: sprite,
                    position: position,
                    rotation: rotation,
                    scale: scale
                )
            )
        }
        
        engine.output.render?.draw(nodes: nodes)
    }
}
