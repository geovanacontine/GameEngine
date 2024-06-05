import Foundation

extension EntityManager {
    func queryArchetypes(_ components: [any Component.Type]) -> [Archetype] {
        archetypes.filter { archetype in
            components.allSatisfy { component in
                archetype.componentTypes.contains(where: { $0 == component })
            }
        }
    }
    
    func archetypeId(for componentTypes: [any Component.Type]) -> Int? {
        archetypes.firstIndex(where: { $0.componentTypes.isEqual(to: componentTypes) })
    }
    
    func modify(entityId: Int, completion: (inout [any Component]) -> Void) {
        guard let entity = entities[entityId] else { return }
        
        var components = archetypes[entity.archetypeId].moveEntityOut(id: entity.archetypeRow)
        completion(&components)
        
        if let existingArchetypeId = archetypeId(for: components.types) {
            moveIn(archetypeId: existingArchetypeId, entityId: entityId, components: components)
        } else {
            let archetypeId = newArchetype(with: components)
            moveIn(archetypeId: archetypeId, entityId: entityId, components: components)
        }
    }
    
    func moveIn(archetypeId: Int, entityId: Int, components: [any Component]) {
        let newEntityRow = archetypes[archetypeId].moveEntityIn(components)
        entities[entityId]?.archetypeId = archetypeId
        entities[entityId]?.archetypeRow = newEntityRow
    }
    
    func newArchetype(with components: [any Component]) -> Int {
        let newArchetype = Archetype(with: components.types)
        let newArchetypeId = archetypes.count
        archetypes.append(newArchetype)
        return newArchetypeId
    }
    
    func spawnEntityWithNewArchetype(components: [any Component]) -> Int {
        let newArchetypeId = newArchetype(with: components)
        let archetypeRow = archetypes[newArchetypeId].moveEntityIn(components)
        let newEntity = Entity(archetypeId: newArchetypeId, archetypeRow: archetypeRow)
        let entityID = entities.count
        entities.append(newEntity)
        return entityID
    }
    
    func spawnEntityOnExistingArchetype(withId archetypeId: Int, components: [any Component]) -> Int {
        let archetype = archetypes[archetypeId]
        let archetypeRow = archetype.moveEntityIn(components)
        let newEntity = Entity(archetypeId: archetypeId, archetypeRow: archetypeRow)
        let entityID = entities.count
        entities.append(newEntity)
        return entityID
    }
}
