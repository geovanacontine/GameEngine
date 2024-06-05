import Foundation

class World {
    
    // Data
    private var systems: [System] = []
    private let engine = GameEngine.shared
    
    // Timers
    private var timer: Timer?
    private var lastUpdate: TimeInterval
    private var frameRate: Double { engine.settings.desiredFrameRate }
    
    // Analytics
    private var clock = ContinuousClock()
    private let totalLoopTime = 1.0/60.0
    
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
