import Foundation

class EntityManager {
    
    var entities: [Entity?]
    var archetypes: [Archetype]
    
    init() {
        entities = []
        archetypes = []
    }
}

// MARK: - Public

extension EntityManager {
    @discardableResult
    func spawn(_ components: any Component...) -> Int {
        if let archetypeId = archetypeId(for: components.types) {
            spawnEntityOnExistingArchetype(withId: archetypeId, components: components)
        } else {
            spawnEntityWithNewArchetype(components: components)
        }
    }
    
    func destroy(entityID: Int) {
        guard let entity = entities[entityID] else { return }
        archetypes[entity.archetypeId].moveEntityOut(id: entity.archetypeRow)
        entities[entityID] = nil
    }
    
    func add(component: any Component, to entityId: Int) {
        modify(entityId: entityId) { components in
            components.append(component)
        }
    }
    
    func remove(component: any Component.Type, from entityId: Int) {
        modify(entityId: entityId) { components in
            components.removeAll(where: { $0.id == component.id })
        }
    }
}
