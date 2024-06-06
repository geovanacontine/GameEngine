import Foundation

enum AnalyticType {
    case time(deltaTime: Double)
    case entities(alive: Int, dead: Int)
    case archetypes(count: Int)
    case systems(performance: [String: Double])
}

struct AnalyticsData {
    var elapsedTime: Double = 0
    var aliveEntities: Int = 0
    var deadEntities: Int = 0
    var archetypes: Int = 0
    var systems: [String: Double] = [:]
}

class GameAnalytics {
    
    private(set) var data = AnalyticsData()
    
    func send(type: AnalyticType) {
        switch type {
        case .time(let deltaTime):
            data.elapsedTime += deltaTime
        case .entities(let alive, let dead):
            data.aliveEntities = alive
            data.deadEntities = dead
        case .archetypes(let count):
            data.archetypes = count
        case .systems(let performance):
            data.systems = performance
        }
    }
}
