import Foundation

struct RenderSystem: System {
    
    func update(deltaTime: TimeInterval) {
        
        var nodes: [RenderNode] = []
        
        c.get(id: "Move") { arch in
            arch.forEach(Mesh.self, Position.self) { mesh, position in
                nodes.append(
                    RenderNode(
                        mesh: mesh,
                        position: position,
                        rotation: .init(x: 0, y: 0, z: 0),
                        scale: .init(x: 0, y: 0, z: 0)
                    )
                )
            }
        }
        
//        for i in c.idles.meshes.allElements {
//            nodes.append(
//                RenderNode(
//                    mesh: c.idles.meshes[i],
//                    position: c.idles.positions[i],
//                    rotation: c.idles.rotations[i],
//                    scale: c.idles.scales[i]
//                )
//            )
//        }
        
        manager.output.render?.draw(nodes: nodes)
    }
}
