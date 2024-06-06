import Foundation

@Observable
class AppleAnalyticsData {
    var elapsedTime: Double = 0
    var aliveEntities: Int = 0
    var deadEntities: Int = 0
    var archetypes: Int = 0
    var systems: [String: Double] = [:]
}
