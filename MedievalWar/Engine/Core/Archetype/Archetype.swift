import Foundation

class Archetype {
    
    let componentTypes: [any Component.Type]
    
    var entities: [ArchetypeEntity]
    var components: [[any Component]]
    
    init(with componentTypes: [any Component.Type]) {
        self.componentTypes = componentTypes
        self.entities = []
        self.components = .init(repeating: [], count: componentTypes.count)
    }
}

// MARK: - Add/Remove

extension Archetype {
    func moveEntityIn(_ newComponents: [any Component]) -> Int {
        let entityId = addArchetypeEntity()
        addComponents(newComponents)
        return entityId
    }
    
    @discardableResult
    func moveEntityOut(id: Int) -> [any Component] {
        let entityIndex = entities.firstIndex(where: { $0.externalId == id })!
        let internalId = entities[entityIndex].internalId!
        entities[entityIndex].internalId = nil
        
        updateInternalIds(startingFrom: id)
        let removedComponents = removeComponents(at: internalId)
        return removedComponents
    }
}

// MARK: - Equatable

extension Archetype: Equatable {
    static func == (lhs: Archetype, rhs: Archetype) -> Bool {
        lhs.componentTypes.isEqual(to: rhs.componentTypes)
    }
}
