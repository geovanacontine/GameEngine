import simd

struct Vertex: Sizable {
    
    let position: simd_float3
    let color: simd_float4
    let textureCoordinates: simd_float2
    
    init(
        position: simd_float3,
        color: simd_float4 = .init(x: 1, y: 0, z: 0, w: 1),
        textureCoordinates: simd_float2 = .zero
    ) {
        self.position = position
        self.color = color
        self.textureCoordinates = textureCoordinates
    }
}
