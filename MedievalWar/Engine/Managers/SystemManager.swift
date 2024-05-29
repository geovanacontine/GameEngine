import Foundation

class SystemManager {
    
    // Data
    private(set) var systems: [System] = []
}

// MARK: - Internal

extension SystemManager {
    func register(_ systems: [System]) {
        self.systems = systems
    }
    
    func runSystems(deltaTime: TimeInterval) {
        for system in systems {
            system.update(deltaTime: deltaTime)
        }
    }
}
