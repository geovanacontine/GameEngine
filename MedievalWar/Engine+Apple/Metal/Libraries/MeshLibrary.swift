import MetalKit

class MeshLibrary: FlyweightFactory<MTLMesh, MeshType> {
    
    private let device: MTLDevice
    
    init(device: MTLDevice) {
        self.device = device
    }
    
    override func makeObject(ofType objectType: MeshType) throws -> MTLMesh {
        switch objectType {
        case .triangle: try triangleMesh()
        case .quad: try quadMesh()
        }
    }
    
    private func triangleMesh() throws -> MTLMesh {
        let vertices: [Vertex] = [
            .init(position: .init(x: 0, y: 1, z: 0), color: .init(x: 1, y: 0, z: 0, w: 1)),
            .init(position: .init(x: -1, y: -1, z: 0), color: .init(x: 0, y: 1, z: 0, w: 1)),
            .init(position: .init(x: 1, y: -1, z: 0), color: .init(x: 0, y: 0, z: 1, w: 1))
        ]
        
        return try MTLMesh(device: device, vertices: vertices)
    }
    
    private func quadMesh() throws -> MTLMesh {
        let vertices: [Vertex] = [
            .init(position: .init(x: -1, y: 1, z: 0), color: .init(x: 1, y: 0, z: 0, w: 1)),
            .init(position: .init(x: -1, y: -1, z: 0), color: .init(x: 0, y: 1, z: 0, w: 1)),
            .init(position: .init(x: 1, y: -1, z: 0), color: .init(x: 0, y: 0, z: 1, w: 1)),
            
            .init(position: .init(x: -1, y: 1, z: 0), color: .init(x: 1, y: 0, z: 0, w: 1)),
            .init(position: .init(x: 1, y: 1, z: 0), color: .init(x: 1, y: 0, z: 1, w: 1)),
            .init(position: .init(x: 1, y: -1, z: 0), color: .init(x: 0, y: 0, z: 1, w: 1))
        ]
        
        return try MTLMesh(device: device, vertices: vertices)
    }
}

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
