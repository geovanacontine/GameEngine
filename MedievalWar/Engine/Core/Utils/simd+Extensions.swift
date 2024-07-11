import simd

protocol Sizable {
    static func stride(count: Int) -> Int
    static func size(count: Int) -> Int
}

extension Sizable {
    static func stride(count: Int = 1) -> Int {
        MemoryLayout<Self>.stride * count
    }
    
    static func size(count: Int = 1) -> Int {
        MemoryLayout<Self>.size * count
    }
}

extension Bool: Sizable {}
extension simd_float1: Sizable {}
extension simd_float2: Sizable {}
extension simd_float3: Sizable {}
extension simd_float4: Sizable {}
extension matrix_float4x4: Sizable {}
