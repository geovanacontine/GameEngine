import MetalKit

struct MetalManager {
    
    // Settings
    let pixelFormat: MTLPixelFormat
    let depthStencilPixelFormat: MTLPixelFormat
    
    // State
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    
    // Public Libraries
    let meshLibrary: MeshLibrary
    
    // Data
    var depthStencilState: MTLDepthStencilState!
    var renderPipelineState: MTLRenderPipelineState!
    var vertexFunction: MTLFunction!
    var vertexDescriptor: MTLVertexDescriptor!
    var fragmentFunction: MTLFunction!
    
    init() throws {
        
        guard let device = MTLCreateSystemDefaultDevice() else { throw MetalLibraryError.deviceNotFound }
        guard let defaultLibrary = device.makeDefaultLibrary() else { throw MetalLibraryError.defaultLibraryNotFound }
        guard let commandQueue = device.makeCommandQueue() else { throw MetalLibraryError.defaultCommandQueueNotFound }
        
        self.pixelFormat = .bgra8Unorm
        self.depthStencilPixelFormat = .depth32Float
        
        self.device = device
        self.commandQueue = commandQueue
        
        meshLibrary = MeshLibrary(device: device)
        
        vertexFunction = defaultLibrary.makeFunction(name: "basicVertexShader")!
        fragmentFunction = defaultLibrary.makeFunction(name: "basicFragmentShader")!
        vertexDescriptor = makeVertexDescriptor()
        depthStencilState = makeDepthStencilState()
        renderPipelineState = makeRenderPipelineState()
    }
}

// MARK: - Factories

extension MetalManager {
    func makeVertexDescriptor() -> MTLVertexDescriptor {
        let descriptor = MTLVertexDescriptor()
        
        // Position
        descriptor.attributes[0].format = .float3
        descriptor.attributes[0].bufferIndex = 0
        descriptor.attributes[0].offset = 0
        
        // Color
        descriptor.attributes[1].format = .float4
        descriptor.attributes[1].bufferIndex = 0
        descriptor.attributes[1].offset = simd_float3.size()
        
        // Layout
        descriptor.layouts[0].stride = Vertex.stride()
        
        return descriptor
    }
    
    func makeDepthStencilState() -> MTLDepthStencilState {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        return device.makeDepthStencilState(descriptor: depthStencilDescriptor)!
    }
    
    func makeRenderPipelineState() -> MTLRenderPipelineState {
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.colorAttachments[0].pixelFormat = pixelFormat
        pipelineDescriptor.depthAttachmentPixelFormat = depthStencilPixelFormat
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.vertexDescriptor = vertexDescriptor
        return try! device.makeRenderPipelineState(descriptor: pipelineDescriptor)
    }
}
