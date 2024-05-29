import Foundation

class EntityManager {
    
    // Dependencies
    private let componentManager: ComponentManager
    
    // Data
    private let deadEntityId = -1
    private var entities: [Int] = []
    
    init(componentManager: ComponentManager) {
        self.componentManager = componentManager
    }
}

// MARK: - Public

extension EntityManager {
    func spawn(withComponents newComponents: [Component]) -> Int {
        let nextId = entities.count
        entities.append(nextId)
        componentManager.updateComponents(with: newComponents)
        return nextId
    }
    
    func destroy(id: Int) {
        componentManager.removeAllComponents(forEntity: id)
        killEntity(withId: id)
    }
}

// MARK: - Private

private extension EntityManager {
    func killEntity(withId id: Int) {
        entities[id] = deadEntityId
    }
}
