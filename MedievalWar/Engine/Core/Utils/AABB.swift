import Foundation

// Axis-Aligned Bounding Box
class AABB {
    
    let center: CGPoint
    let width: Double
    let height: Double
    
    var minX: Double { center.x - width/2 }
    var maxX: Double { center.x + width/2 }
    var minY: Double { center.y - height/2 }
    var maxY: Double { center.y + height/2 }
    
    init(x: Double, y: Double, width: Double, height: Double) {
        self.center = .init(x: x, y: y)
        self.width = width
        self.height = height
    }
    
    init(containing aabbs: [AABB]) {
        let minX = aabbs.map({ $0.minX }).min() ?? .zero
        let maxX = aabbs.map({ $0.maxX }).max() ?? .zero
        let minY = aabbs.map({ $0.minY }).min() ?? .zero
        let maxY = aabbs.map({ $0.maxY }).max() ?? .zero
        
        let width = maxX - minX
        let height = maxY - minY
        
        let centerX = minX + width/2
        let centerY = minY + height/2
        
        self.center = CGPoint(x: centerX, y: centerY)
        self.width = width
        self.height = height
    }
}

extension AABB {
    func intersects(_ aabb: AABB) -> Bool {
        let xRange = aabb.minX...aabb.maxX
        let isInXRange = xRange.contains(minX) || xRange.contains(maxX)
        
        let yRange = aabb.minY...aabb.maxY
        let isInYRange = yRange.contains(minY) || yRange.contains(maxY)
        
        return isInXRange && isInYRange
    }
    
    func offset(x: Double, y: Double) -> AABB {
        .init(
            x: center.x + x,
            y: center.y + y,
            width: width,
            height: height
        )
    }
}
