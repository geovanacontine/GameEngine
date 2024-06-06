import Foundation

struct AnalyticsSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        let analytics = engine.analytics
        let data = analytics.data
        
        let allEntities = entityManager.entities
        let aliveEntities = allEntities.compactMap({ $0 })
        let deadEntities = allEntities.count - aliveEntities.count
        let archetypesCount = entityManager.archetypes.count
        
        analytics.send(type: .time(deltaTime: deltaTime))
        analytics.send(type: .entities(alive: aliveEntities.count, dead: deadEntities))
        analytics.send(type: .archetypes(count: archetypesCount))
        
        engine.output.analytics?.draw(data: data)
    }
}
