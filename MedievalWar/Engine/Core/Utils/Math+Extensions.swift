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
    
    func scaled(to scale: simd_float3) -> matrix_float4x4 {
        
        let x = scale.x
        let y = scale.y
        let z = scale.z
        
        let scaleMatrix = matrix_float4x4(
            .init(x: x, y: 0, z: 0, w: 0),
            .init(x: 0, y: y, z: 0, w: 0),
            .init(x: 0, y: 0, z: z, w: 0),
            .init(x: 0, y: 0, z: 0, w: 1)
        )
        
        return matrix_multiply(self, scaleMatrix)
    }
    
    func rotated(angle: Float, axis: simd_float3) -> matrix_float4x4 {
        
        var result = matrix_identity_float4x4
        
        let x = axis.x
        let y = axis.y
        let z = axis.z
        
        let c: Float = cos(angle)
        let s: Float = sin(angle)
        
        let mc: Float = (1 - c)
        
        let r1c1: Float = x * x * mc + c
        let r2c1: Float = x * y * mc + z * s
        let r3c1: Float = x * z * mc - y * s
        let r4c1: Float = 0.0
        
        let r1c2: Float = y * x * mc - z * s
        let r2c2: Float = y * y * mc + c
        let r3c2: Float = y * z * mc + x * s
        let r4c2: Float = 0.0
        
        let r1c3: Float = z * x * mc + y * s
        let r2c3: Float = z * y * mc - x * s
        let r3c3: Float = z * z * mc + c
        let r4c3: Float = 0.0
        
        let r1c4: Float = 0.0
        let r2c4: Float = 0.0
        let r3c4: Float = 0.0
        let r4c4: Float = 1.0
        
        result.columns = (
            simd_float4(r1c1, r2c1, r3c1, r4c1),
            simd_float4(r1c2, r2c2, r3c2, r4c2),
            simd_float4(r1c3, r2c3, r3c3, r4c3),
            simd_float4(r1c4, r2c4, r3c4, r4c4)
        )
        
        return matrix_multiply(self, result)
    }
}
