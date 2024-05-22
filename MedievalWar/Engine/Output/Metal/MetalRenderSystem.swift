import MetalKit

class MetalRenderSystem: NSObject {
    
    // Dependencies
    let manager: MetalRenderManager
    
    // Nodes
    var object: MetalRenderObject = .init(pipelineState: .basic, mesh: .triangle)
    
    init(pixelFormat: MTLPixelFormat = .bgra8Unorm) {
        manager = try! MetalRenderManager(pixelFormat: pixelFormat)
    }
}

// MARK: - MTKViewDelegate

extension MetalRenderSystem: MTKViewDelegate {
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }
        guard let descriptor = view.currentRenderPassDescriptor else { return }
        guard let commandBuffer = manager.commandQueue.makeCommandBuffer() else { return }
        
        // Background
        descriptor.colorAttachments[0].clearColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        
        let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)!
        try! render(object: object, withEncoder: encoder)
        encoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
}

// MARK: - Render

private extension MetalRenderSystem {
     func render(object: MetalRenderObject, withEncoder encoder: MTLRenderCommandEncoder) throws {
        let pipeline = try manager.pipelineState.object(ofType: object.pipelineState)
        let mesh = try manager.meshLibrary.object(ofType: object.mesh)
        
        encoder.setRenderPipelineState(pipeline)
        encoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        encoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.verticesCount)
    }
}
