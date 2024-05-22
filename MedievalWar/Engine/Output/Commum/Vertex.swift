import simd

struct Vertex: Sizable {
    let position: simd_float3
    let color: simd_float4
}
