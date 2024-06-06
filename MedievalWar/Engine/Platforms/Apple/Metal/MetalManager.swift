import MetalKit

struct MetalManager {
    
    let pixelFormat: MTLPixelFormat
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    
    // Internal Libraries
    private let vertexShader: VertexShaderLibrary
    private let fragmentShader: FragmentShaderLibrary
    private let vertexDescriptor: VertexDescriptorLibrary
    private let pipelineDescriptor: PipelineDescriptorLibrary
    
    // Public Libraries
    let pipelineState: PipelineStateLibrary
    let meshLibrary: MeshLibrary
    
    init(pixelFormat: MTLPixelFormat) throws {
        guard let device = MTLCreateSystemDefaultDevice() else { throw MetalLibraryError.deviceNotFound }
        guard let defaultLibrary = device.makeDefaultLibrary() else { throw MetalLibraryError.defaultLibraryNotFound }
        guard let commandQueue = device.makeCommandQueue() else { throw MetalLibraryError.defaultCommandQueueNotFound }
        
        self.pixelFormat = pixelFormat
        self.device = device
        self.commandQueue = commandQueue
        
        vertexShader = VertexShaderLibrary(library: defaultLibrary)
        fragmentShader = FragmentShaderLibrary(library: defaultLibrary)
        vertexDescriptor = VertexDescriptorLibrary()
        
        pipelineDescriptor = PipelineDescriptorLibrary(
            pixelFormat: pixelFormat,
            vertexShader: vertexShader,
            fragmentShader: fragmentShader,
            vertexDescriptor: vertexDescriptor
        )
        
        pipelineState = PipelineStateLibrary(device: device, descriptorLibrary: pipelineDescriptor)
        meshLibrary = MeshLibrary(device: device)
    }
}
