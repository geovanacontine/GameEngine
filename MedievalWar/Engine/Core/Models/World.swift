import Foundation

class World {
    
    // Managers
    let entityManager = EntityManager()
    
    // Data
    private var systems: [System] = []
    private let engine = GameEngine.shared
    
    // Timers
    private var timer: Timer?
    private var lastUpdate: TimeInterval
    private var frameRate: Double { engine.settings.desiredFrameRate }
    
    init() {
        lastUpdate = Date().timeIntervalSince1970
        setupMainLoop()
    }
}

extension World {
    func registerSystems(_ systems: System...) {
        self.systems = systems
    }
}

// MARK: - Private methods

private extension World {
    func setupMainLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 1/frameRate, repeats: true) { [weak self] timer in
            self?.update()
        }
    }
    
    func update() {
        guard !engine.settings.isPaused else { return }
        
        // Update deltaTime
        let now = Date().timeIntervalSince1970
        let deltaTime = now - lastUpdate
        lastUpdate = now
        
        runSystems(deltaTime: deltaTime)
    }
    
    func runSystems(deltaTime: TimeInterval) {
        
        var systemPerformance: [String: Double] = [:]
        
        for system in systems {
            
            let startTime = Date().timeIntervalSince1970
            system.update(entityManager: entityManager, deltaTime: deltaTime)
            let duration = Date().timeIntervalSince1970 - startTime
            
            let systemName = String(describing: type(of: system))
            let performance = duration / (1/frameRate)
            systemPerformance.updateValue(performance, forKey: systemName)
        }
        
        engine.analytics.send(type: .systems(performance: systemPerformance))
    }
}
