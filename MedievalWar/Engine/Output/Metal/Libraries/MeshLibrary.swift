import MetalKit

class MeshLibrary: FlyweightFactory<Mesh, MeshType> {
    
    private let device: MTLDevice
    
    init(device: MTLDevice) {
        self.device = device
    }
    
    override func makeObject(ofType objectType: MeshType) throws -> Mesh {
        switch objectType {
        case .triangle: try triangleMesh()
        }
    }
    
    private func triangleMesh() throws -> Mesh {
        let vertices: [Vertex] = [
            .init(position: .init(x: 0, y: 1, z: 0), color: .init(x: 1, y: 0, z: 0, w: 1)),
            .init(position: .init(x: -1, y: -1, z: 0), color: .init(x: 0, y: 1, z: 0, w: 1)),
            .init(position: .init(x: 1, y: -1, z: 0), color: .init(x: 0, y: 0, z: 1, w: 1))
        ]
        
        return try Mesh(device: device, vertices: vertices)
    }
}

struct Mesh {
    
    let vertexBuffer: MTLBuffer
    let verticesCount: Int
    
    init(device: MTLDevice, vertices: [Vertex]) throws {
        guard let buffer = device.makeBuffer(bytes: vertices, length: Vertex.size(count: vertices.count))
        else { throw MetalLibraryError.deviceMakeBufferFailed }
        
        vertexBuffer = buffer
        verticesCount = vertices.count
    }
}
