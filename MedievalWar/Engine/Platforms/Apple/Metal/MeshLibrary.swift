import MetalKit

class MeshLibrary: FlyweightFactory<MTLMesh, MeshType> {
    
    private let device: MTLDevice
    
    init(device: MTLDevice) {
        self.device = device
    }
    
    override func makeObject(ofType objectType: MeshType) throws -> MTLMesh {
        switch objectType {
        case .triangle: try triangleMesh()
        case .square: try squareMesh()
        case .hexagon: try hexagonMesh()
        case .circle: try circleMesh()
        case .cube: try cubeMesh()
        }
    }
    
    private func triangleMesh() throws -> MTLMesh {
        try MTLMesh(
            device: device,
            vertices: polygonVertices(sides: 3)
        )
    }
    
    private func squareMesh() throws -> MTLMesh {
        try MTLMesh(
            device: device,
            vertices: polygonVertices(sides: 4, startPosition: .init(x: -1, y: -1, z: 0))
        )
    }
    
    private func hexagonMesh() throws -> MTLMesh {
        try MTLMesh(
            device: device,
            vertices: polygonVertices(sides: 6)
        )
    }
    
    private func circleMesh() throws -> MTLMesh {
        try MTLMesh(
            device: device,
            vertices: polygonVertices(sides: 50)
        )
    }
    
    private func cubeMesh() throws -> MTLMesh {
        let vertices = [
            
            //Left
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(1, 0, 0, 1)),
            Vertex(position: .init(-1.0,-1.0, 1.0), color: .init(1, 0, 0, 1)),
            Vertex(position: .init(-1.0, 1.0, 1.0), color: .init(1, 0, 0, 1)),
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(1, 0, 0, 1)),
            Vertex(position: .init(-1.0, 1.0, 1.0), color: .init(1, 0, 0, 1)),
            Vertex(position: .init(-1.0, 1.0,-1.0), color: .init(1, 0, 0, 1)),
            
            // Right
            Vertex(position: .init( 1.0, 1.0, 1.0), color: .init(0, 1, 0, 1)),
            Vertex(position: .init( 1.0,-1.0,-1.0), color: .init(0, 1, 0, 1)),
            Vertex(position: .init( 1.0, 1.0,-1.0), color: .init(0, 1, 0, 1)),
            Vertex(position: .init( 1.0,-1.0,-1.0), color: .init(0, 1, 0, 1)),
            Vertex(position: .init( 1.0, 1.0, 1.0), color: .init(0, 1, 0, 1)),
            Vertex(position: .init( 1.0,-1.0, 1.0), color: .init(0, 1, 0, 1)),
            
            // Top
            Vertex(position: .init( 1.0, 1.0, 1.0), color: .init(0, 0, 1, 1)),
            Vertex(position: .init( 1.0, 1.0,-1.0), color: .init(0, 0, 1, 1)),
            Vertex(position: .init(-1.0, 1.0,-1.0), color: .init(0, 0, 1, 1)),
            Vertex(position: .init( 1.0, 1.0, 1.0), color: .init(0, 0, 1, 1)),
            Vertex(position: .init(-1.0, 1.0,-1.0), color: .init(0, 0, 1, 1)),
            Vertex(position: .init(-1.0, 1.0, 1.0), color: .init(0, 0, 1, 1)),
            
            // Bottom
            Vertex(position: .init( 1.0,-1.0, 1.0), color: .init(1, 1, 0, 1)),
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(1, 1, 0, 1)),
            Vertex(position: .init( 1.0,-1.0,-1.0), color: .init(1, 1, 0, 1)),
            Vertex(position: .init( 1.0,-1.0, 1.0), color: .init(1, 1, 0, 1)),
            Vertex(position: .init(-1.0,-1.0, 1.0), color: .init(1, 1, 0, 1)),
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(1, 1, 0, 1)),
            
            // Back
            Vertex(position: .init( 1.0, 1.0,-1.0), color: .init(0, 1, 1, 1)),
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(0, 1, 1, 1)),
            Vertex(position: .init(-1.0, 1.0,-1.0), color: .init(0, 1, 1, 1)),
            Vertex(position: .init( 1.0, 1.0,-1.0), color: .init(0, 1, 1, 1)),
            Vertex(position: .init( 1.0,-1.0,-1.0), color: .init(0, 1, 1, 1)),
            Vertex(position: .init(-1.0,-1.0,-1.0), color: .init(0, 1, 1, 1)),
            
            // Front
            Vertex(position: .init(-1.0, 1.0, 1.0), color: .init(1, 0, 1, 1)),
            Vertex(position: .init(-1.0,-1.0, 1.0), color: .init(1, 0, 1, 1)),
            Vertex(position: .init( 1.0,-1.0, 1.0), color: .init(1, 0, 1, 1)),
            Vertex(position: .init( 1.0, 1.0, 1.0), color: .init(1, 0, 1, 1)),
            Vertex(position: .init(-1.0, 1.0, 1.0), color: .init(1, 0, 1, 1)),
            Vertex(position: .init( 1.0,-1.0, 1.0), color: .init(1, 0, 1, 1))
        ]
        
        return try MTLMesh(device: device, vertices: vertices)
    }
}

// MARK: - Helpers

private extension MeshLibrary {
    func polygonVertices(
        sides: Float,
        color: simd_float4 = .init(x: 1, y: 0, z: 0, w: 1),
        startPosition: simd_float3 = .init(x: 0, y: 1, z: 0)
    ) -> [Vertex] {
        
        let originVertex = Vertex(position: startPosition, color: color)
        let center = Vertex(position: .init(x: 0, y: 0, z: 0), color: color)
        let i = (2 * Float.pi)/sides
        
        let rotationMatrix = matrix_float3x3(
            .init(x: cos(i), y: -sin(i), z: 0),
            .init(x: sin(i), y: cos(i), z: 0),
            .init(x: 0, y: 0, z: 1)
        )
        
        var vertices: [Vertex] = []
        var startPosition = originVertex.position
        
        for _ in 0...Int(sides) {
            
            let endPosition = matrix_multiply(startPosition, rotationMatrix)
            
            vertices.append(Vertex(position: startPosition, color: color))
            vertices.append(Vertex(position: endPosition, color: color))
            vertices.append(center)
            
            startPosition = endPosition
        }
        
        return vertices
    }
}
