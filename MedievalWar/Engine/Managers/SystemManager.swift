import Foundation

class SystemManager {
    
    // Data
    private(set) var systems: [System] = []
    
    // Analytics
    private var clock = ContinuousClock()
    private let totalLoopTime = 1.0/60.0
}

// MARK: - Internal

extension SystemManager {
    func register(_ systems: [System]) {
        self.systems = systems
    }
    
    func runSystems(deltaTime: TimeInterval) {
        for system in systems {
            
            let duration = clock.measure {
                system.update(deltaTime: deltaTime)
            }
            
            let systemName = String(describing: system)
            let prop = (duration / totalLoopTime) * 100
            print("[\(systemName)] - \(prop)")
        }
    }
}
