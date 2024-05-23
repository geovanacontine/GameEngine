import simd

struct RenderNode {
    
    let mesh: MeshComponent
    
    // Calculated
    var modelMatrix: matrix_float4x4
    
    init(
        mesh: MeshComponent,
        transform: TransformComponent
    ) {
        self.mesh = mesh
        
        let position = transform.position
        let simdPosition = simd_float3(x: position.x, y: position.y, z: position.z)
        modelMatrix = matrix_identity_float4x4.translated(to: simdPosition)
    }
}
