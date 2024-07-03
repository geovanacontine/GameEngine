import simd

class CameraNode: Node {
    
    var data: CameraData!
    let hasDepth: Bool
    
    init(
        projectionType: CameraProjectionType,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        hasDepth = projectionType == .perspective
        super.init(position: position, rotation: rotation, scale: scale)
        
        let projection = projectionMatrix(ofType: projectionType, at: position)
        data = .init(viewMatrix: modelMatrix, projectionMatrix: projection)
    }
    
    private func projectionMatrix(ofType type: CameraProjectionType, at position: Position) -> matrix_float4x4 {
        
        let settings = GameEngine.shared.settings
        let aspectRatio = settings.screenWidth / settings.screenHeight
        
        switch type {
        case .perspective:
            return .projectionPerspective(degreesFov: 45, aspectRatio: Float(aspectRatio), near: 0.1, far: 1000)
        case .orthographic:
            return .projectionOrthographic(
                position: Float(position.z),
                distance: 100, 
                size: 100,
                width: Float(settings.screenWidth),
                height: Float(settings.screenHeight)
            )
        }
    }
}

extension CameraNode {
    struct CameraData: Sizable {
        var viewMatrix: matrix_float4x4
        var projectionMatrix: matrix_float4x4
    }
}
