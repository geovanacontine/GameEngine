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
    
    func rotatedAroundX(angle i: Float) -> matrix_float4x4 {
        
        let rotationMatrix = matrix_float4x4(
            .init(x: 1, y: 0, z: 0, w: 0),
            .init(x: 0, y: cos(i), z: -sin(i), w: 0),
            .init(x: 0, y: sin(i), z: cos(i), w: 0),
            .init(x: 0, y: 0, z: 0, w: 1)
        )
        
        return matrix_multiply(self, rotationMatrix)
    }
    
    func rotatedAroundY(angle i: Float) -> matrix_float4x4 {
        
        let rotationMatrix = matrix_float4x4(
            .init(x: cos(i), y: 0, z: sin(i), w: 0),
            .init(x: 0, y: 1, z: 0, w: 0),
            .init(x: -sin(i), y: 0, z: cos(i), w: 0),
            .init(x: 0, y: 0, z: 0, w: 1)
        )
        
        return matrix_multiply(self, rotationMatrix)
    }
    
    func rotatedAroundZ(angle i: Float) -> matrix_float4x4 {
        
        let rotationMatrix = matrix_float4x4(
            .init(x: cos(i), y: -sin(i), z: 0, w: 0),
            .init(x: sin(i), y: cos(i), z: 0, w: 0),
            .init(x: 0, y: 0, z: 1, w: 0),
            .init(x: 0, y: 0, z: 0, w: 1)
        )
        
        return matrix_multiply(self, rotationMatrix)
    }
    
    func rotated(to rotation: simd_float3) -> matrix_float4x4 {
        rotatedAroundX(angle: rotation.x)
            .rotatedAroundY(angle: rotation.y)
            .rotatedAroundZ(angle: rotation.z)
    }
    
    static func projectionPerspective(degreesFov: Float, aspectRatio: Float, near n: Float, far f: Float) -> matrix_float4x4 {
        
        let fov = degreesFov.toRadians()
        
        let a = 1/(aspectRatio * tan(fov/2))
        let b = 1/(tan(fov/2))
        let c = -((f+n)/(f-n))
        let d = -(2*f*n)/(f-n)
        
        let projectionPerspectiveMatrix = matrix_float4x4(
            .init(x: a, y: 0, z: 0, w: 0),
            .init(x: 0, y: b, z: 0, w: 0),
            .init(x: 0, y: 0, z: c, w: -1),
            .init(x: 0, y: 0, z: d, w: 1)
        )
        
        return projectionPerspectiveMatrix
    }
    
    static func projectionOrthographic(
        position: Float,
        distance: Float,
        size: Float,
        width: Float,
        height: Float
    ) -> matrix_float4x4 {
        
        let near: Float = position
        let far: Float = position + distance
        let right: Float = (width/size)/2
        let left: Float = -(width/size)/2
        let top: Float = (height/size)/2
        let bottom: Float = -(height/size)/2
        
        let projectionOrthographicMatrix = matrix_float4x4(
            .init(x: 2/(right-left), y: 0, z: 0, w: -(right+left)/(right-left)),
            .init(x: 0, y: 2/(top-bottom), z: 0, w: -(top+bottom)/(top-bottom)),
            .init(x: 0, y: 0, z: -2/(far-near), w: -(far+near)/(far-near)),
            .init(x: 0, y: 0, z: 0, w: 1)
        )
        
        return projectionOrthographicMatrix
    }
}


extension Float {
    func toRadians() -> Float {
        (self/180) * .pi
    }
}
