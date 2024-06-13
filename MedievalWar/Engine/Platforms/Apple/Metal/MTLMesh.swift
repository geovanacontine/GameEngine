import MetalKit

struct MTLMesh {
    
    let vertexBuffer: MTLBuffer
    let verticesCount: Int
    
    init(device: MTLDevice, vertices: [Vertex]) throws {
        guard let buffer = device.makeBuffer(bytes: vertices, length: Vertex.size(count: vertices.count))
        else { throw MetalLibraryError.deviceMakeBufferFailed }
        
        vertexBuffer = buffer
        verticesCount = vertices.count
    }
}
