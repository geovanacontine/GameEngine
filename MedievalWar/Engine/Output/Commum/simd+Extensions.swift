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

extension simd_float3: Sizable {}
