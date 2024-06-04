import Foundation

class World {
    
    // Data
    private var entities: [Int?] = []
    
    private var archetypes: [String: Archetype] = [:]
    
    func get(id: String, completion: (inout Archetype) -> Void) {
        var archetype = archetypes[id]!
        completion(&archetype)
        archetypes.updateValue(archetype, forKey: id)
    }
}

// MARK: - Public

extension World {
    
    @discardableResult
    func spawn(archetype: String, components: [any Component]) -> Int {
        archetypes[archetype]?.add(newComponents: components)
        
        let nextId = entities.count
        entities.append(nextId)
        return nextId
    }
    
    func destroy(id: Int) {
        entities[id] = nil
    }
    
    func register(archetype: Archetype, withId id: String) {
        archetypes.updateValue(archetype, forKey: id)
    }
}
