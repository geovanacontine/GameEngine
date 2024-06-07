import simd

struct RenderNode {
    
    let mesh: Mesh
    
    // Calculated
    var modelMatrix: matrix_float4x4
    
    init(
        mesh: Mesh,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.mesh = mesh
        
        let simdPosition = simd_float3(x: Float(position.x), y: Float(position.y), z: Float(position.z))
        let simdScale = simd_float3(x: Float(scale.x), y: Float(scale.y), z: Float(scale.z))
        let simdRotation = simd_float3(x: Float(rotation.x), y: Float(rotation.y), z: Float(rotation.z))
        
        modelMatrix = matrix_identity_float4x4
            .translated(to: simdPosition)
            .rotated(to: simdRotation)
            .scaled(to: simdScale)
    }
}
