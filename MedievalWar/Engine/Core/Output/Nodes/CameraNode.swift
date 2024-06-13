import simd

class CameraNode: Node {
    
    var data: CameraData!
    
    init(
        projectionType: CameraProjectionType,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        super.init(position: position, rotation: rotation, scale: scale)
        
        let projection = projectionMatrix(ofType: projectionType)
        data = .init(viewMatrix: modelMatrix, projectionMatrix: projection)
    }
    
    private func projectionMatrix(ofType type: CameraProjectionType) -> matrix_float4x4 {
        switch type {
        case .perspective: .projectionPerspective(degreesFov: 45, aspectRatio: 1, near: 0.1, far: 1000)
        }
    }
}

extension CameraNode {
    struct CameraData: Sizable {
        var viewMatrix: matrix_float4x4
        var projectionMatrix: matrix_float4x4
    }
}
