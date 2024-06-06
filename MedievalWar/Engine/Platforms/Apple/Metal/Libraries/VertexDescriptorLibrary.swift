import MetalKit

class VertexDescriptorLibrary: FlyweightFactory<MTLVertexDescriptor, VertexDescriptor> {
    
    override func makeObject(ofType objectType: VertexDescriptor) throws -> MTLVertexDescriptor {
        switch objectType {
        case .basic: basicVertexDescriptor()
        }
    }
    
    private func basicVertexDescriptor() -> MTLVertexDescriptor {
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
}
