import MetalKit

class AppleRender: NSObject, OutputRender {
    
    // Dependencies
    let manager: MetalManager
    
    // Data
    private var camera: CameraNode
    private var nodes: [RenderNode] = []
    
    init(pixelFormat: MTLPixelFormat = .bgra8Unorm) {
        manager = try! MetalManager(pixelFormat: pixelFormat)
        
        camera = CameraNode(
            position: .init(x: 0, y: 0, z: 0),
            rotation: .init(x: 0, y: 0, z: 0),
            scale: .init(x: 1, y: 1, z: 1)
        )
    }
    
    func draw(nodes: [RenderNode]) {
        self.nodes = nodes
    }
    
    func setup(camera: CameraNode) {
        self.camera = camera
    }
    
    func render(node: inout RenderNode, withEncoder encoder: MTLRenderCommandEncoder) throws {
        let pipeline = try manager.pipelineState.object(ofType: node.mesh.pipelineState)
        let mesh = try manager.meshLibrary.object(ofType: node.mesh.meshType)
        
        encoder.setVertexBytes(&camera.matrix, length: matrix_float4x4.size(), index: 1)
        encoder.setVertexBytes(&node.matrix, length: matrix_float4x4.size(), index: 2)
        encoder.setRenderPipelineState(pipeline)
        encoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        encoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.verticesCount)
    }
}

// MARK: - MTKViewDelegate

extension AppleRender: MTKViewDelegate {
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }
        guard let descriptor = view.currentRenderPassDescriptor else { return }
        guard let commandBuffer = manager.commandQueue.makeCommandBuffer() else { return }
        
        // Background
        descriptor.colorAttachments[0].clearColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        
        let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)!
        
        for var node in nodes {
            try! render(node: &node, withEncoder: encoder)
        }
        
        encoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
}
