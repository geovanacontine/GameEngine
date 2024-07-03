import MetalKit

class MeshLibrary: FlyweightFactory<MTLMesh, MeshType> {
    
    private let device: MTLDevice
    
    init(device: MTLDevice) {
        self.device = device
    }
    
    override func makeObject(ofType objectType: MeshType) throws -> MTLMesh {
        switch objectType {
        case .square: try squareMesh()
        case .cube: try cubeMesh()
        }
    }
    
    private func squareMesh() throws -> MTLMesh {
        let vertices = [
            Vertex(position: .init(-1, 1, 0), textureCoordinates: .init(x: 0, y: 0)),
            Vertex(position: .init(-1, -1, 0), textureCoordinates: .init(x: 0, y: 1)),
            Vertex(position: .init(1, -1, 0), textureCoordinates: .init(x: 1, y: 1)),
            
            Vertex(position: .init(1, -1, 0), textureCoordinates: .init(x: 1, y: 1)),
            Vertex(position: .init(1, 1, 0), textureCoordinates: .init(x: 1, y: 0)),
            Vertex(position: .init(-1, 1, 0), textureCoordinates: .init(x: 0, y: 0))
        ]
        
        return try MTLMesh(device: device, vertices: vertices)
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
