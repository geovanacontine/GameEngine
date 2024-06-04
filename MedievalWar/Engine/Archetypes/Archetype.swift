import Foundation

struct Archetype {
    
    let componentTypes: [any Component.Type]
    
    private(set) var entities: [ArchetypeEntity]
    private var components: [[any Component]]
    
    init(componentTypes: [any Component.Type]) {
        self.componentTypes = componentTypes
        self.entities = []
        self.components = .init(repeating: [], count: componentTypes.count)
    }
}

// MARK: - Add/Remove

extension Archetype {
    mutating func add(newComponents: [any Component]) {
        addArchetypeEntity()
        addComponents(newComponents)
    }
    
    mutating func removeEntity(externalId: Int) {
        let entityIndex = entities.firstIndex(where: { $0.externalId == externalId })!
        
        let internalId = entities[entityIndex].internalId!
        entities[entityIndex].internalId = nil
        
        let nextEntity = externalId + 1
        let lastEntity = entities.count - 1
        
        let entitiesToUpdate = nextEntity...lastEntity
        
        for entityId in entitiesToUpdate {
            if entities[entityId].internalId != nil {
                entities[entityId].internalId! -= 1
            }
        }
        
        for componentIndex in components.allElements {
            components[componentIndex].remove(at: internalId)
        }
    }
}

// MARK: - Private

private extension Archetype {
    func deadEntityIndex() -> Int? {
        entities.firstIndex(where: { $0.isDead })
    }
    
    mutating func addComponents(_ newComponents: [any Component]) {
        guard newComponents.count == componentTypes.count else { return }
        
        for newComponent in newComponents {
            let componentIndex = componentTypes.firstIndex(where: { $0 == type(of: newComponent) })!
            components[componentIndex].append(newComponent)
        }
    }
    
    mutating func addArchetypeEntity() {
        // If there is a dead entity
        if let deadEntityIndex = deadEntityIndex() {
            entities[deadEntityIndex].internalId = components.first!.count
        } else {
            let nextExternalId = entities.count
            let nextInternalId = components.first!.count
            let newEntity = ArchetypeEntity(externalId: nextExternalId, internalId: nextInternalId)
            entities.append(newEntity)
        }
    }
}

// MARK: - Fetch

extension Archetype {
    mutating func forEach<T: Component>(_ type: T.Type, completion: (inout T) -> Void) {
        let componentIndex = componentTypes.firstIndex(where: { $0 == type })!
        var componentList = components[componentIndex] as! [T]
        
        for index in componentList.allElements {
            completion(&componentList[index])
        }
        
        components[componentIndex] = componentList
    }
    
    mutating func forEach<T1: Component, T2: Component>(
        _ type1: T1.Type,
        _ type2: T2.Type,
        completion: (inout T1, inout T2) -> Void
    ) {
        let index1 = componentTypes.firstIndex(where: { $0 == type1 })!
        let index2 = componentTypes.firstIndex(where: { $0 == type2 })!
        
        var componentList1 = components[index1] as! [T1]
        var componentList2 = components[index2] as! [T2]
        
        for i in componentList1.allElements {
            completion(
                &componentList1[i],
                &componentList2[i]
            )
        }
        
        components[index1] = componentList1
        components[index2] = componentList2
    }
}
