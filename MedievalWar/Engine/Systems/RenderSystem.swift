import Foundation

struct RenderSystem: System {
    
    let outputManager = OutputManager.shared
    
    func update(world: inout World, deltaTime: TimeInterval) {
        
        let nodes: [RenderNode] = world.meshList.enumerated().compactMap { index, mesh in
            guard let mesh else { return nil }
            guard let transform = world.transformList[index] else { return nil }
            return RenderNode(mesh: mesh, transform: transform)
        }
        
        outputManager.render?.draw(nodes: nodes)
    }
}
