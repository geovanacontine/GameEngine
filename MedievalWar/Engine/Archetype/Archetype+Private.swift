import Foundation

extension Archetype {
    func removeComponents(at id: Int) -> [any Component] {
        components.allElements.map { index in
            components[index].remove(at: id)
        }
    }
    
    func updateInternalIds(startingFrom id: Int) {
        let nextEntity = id + 1
        let entitiesToUpdate = nextEntity..<entities.count
        
        for entityId in entitiesToUpdate {
            if entities[entityId].internalId != nil {
                entities[entityId].internalId! -= 1
            }
        }
    }
    
    func deadEntityIndex() -> Int? {
        entities.firstIndex(where: { $0.isDead })
    }
    
    func addComponents(_ newComponents: [any Component]) {
        guard newComponents.count == componentTypes.count else { return }
        
        for newComponent in newComponents {
            let componentIndex = componentTypes.firstIndex(where: { $0 == type(of: newComponent) })!
            components[componentIndex].append(newComponent)
        }
    }
    
    func addArchetypeEntity() -> Int {
        if let deadEntityIndex = deadEntityIndex() {
            entities[deadEntityIndex].internalId = components.first!.count
            return entities[deadEntityIndex].externalId
        } else {
            let nextExternalId = entities.count
            let nextInternalId = components.first!.count
            let newEntity = ArchetypeEntity(externalId: nextExternalId, internalId: nextInternalId)
            entities.append(newEntity)
            return nextExternalId
        }
    }
}
