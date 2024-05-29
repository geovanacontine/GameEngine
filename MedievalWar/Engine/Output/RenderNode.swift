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
        modelMatrix = matrix_identity_float4x4.translated(to: simdPosition)
    }
}
