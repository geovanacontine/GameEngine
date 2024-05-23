import simd

extension matrix_float4x4 {
    func translated(to position: simd_float3) -> matrix_float4x4 {
        
        let x = position.x
        let y = position.y
        let z = position.z
        
        let translateMatrix = matrix_float4x4(
            .init(x: 1, y: 0, z: 0, w: 0),
            .init(x: 0, y: 1, z: 0, w: 0),
            .init(x: 0, y: 0, z: 1, w: 0),
            .init(x: x, y: y, z: z, w: 1)
        )
        
        return matrix_multiply(self, translateMatrix)
    }
}
