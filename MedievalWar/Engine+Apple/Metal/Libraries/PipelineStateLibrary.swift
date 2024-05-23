import MetalKit

class PipelineStateLibrary: FlyweightFactory<MTLRenderPipelineState, PipelineState> {
    
    private let device: MTLDevice
    private let descriptorLibrary: PipelineDescriptorLibrary
    
    init(
        device: MTLDevice,
        descriptorLibrary: PipelineDescriptorLibrary
    ) {
        self.device = device
        self.descriptorLibrary = descriptorLibrary
    }
    
    override func makeObject(ofType objectType: PipelineState) throws -> MTLRenderPipelineState {
        switch objectType {
        case .basic: try basicPipelineState()
        }
    }
    
    private func basicPipelineState() throws -> MTLRenderPipelineState {
        let pipelineDescriptor = try descriptorLibrary.object(ofType: .basic)
        let pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        return pipelineState
    }
}
