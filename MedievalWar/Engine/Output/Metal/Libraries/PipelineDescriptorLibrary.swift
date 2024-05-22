import MetalKit

class PipelineDescriptorLibrary: FlyweightFactory<MTLRenderPipelineDescriptor, PipelineDescriptor> {
    
    private let pixelFormat: MTLPixelFormat
    private let vertexShader: VertexShaderLibrary
    private let fragmentShader: FragmentShaderLibrary
    private let vertexDescriptor: VertexDescriptorLibrary
    
    init(
        pixelFormat: MTLPixelFormat,
        vertexShader: VertexShaderLibrary,
        fragmentShader: FragmentShaderLibrary,
        vertexDescriptor: VertexDescriptorLibrary
    ) {
        self.pixelFormat = pixelFormat
        self.vertexShader = vertexShader
        self.fragmentShader = fragmentShader
        self.vertexDescriptor = vertexDescriptor
    }
    
    override func makeObject(ofType objectType: PipelineDescriptor) throws -> MTLRenderPipelineDescriptor {
        switch objectType {
        case .basic: try basicPipelineDescriptor()
        }
    }
    
    private func basicPipelineDescriptor() throws -> MTLRenderPipelineDescriptor {
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        
        pipelineDescriptor.colorAttachments[0].pixelFormat = pixelFormat
        pipelineDescriptor.vertexFunction = try vertexShader.object(ofType: .basic)
        pipelineDescriptor.fragmentFunction = try fragmentShader.object(ofType: .basic)
        
        let vertexDescriptor = try vertexDescriptor.object(ofType: .basic)
        pipelineDescriptor.vertexDescriptor = vertexDescriptor
        return pipelineDescriptor
    }
}
