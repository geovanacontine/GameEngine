import Foundation

class GameScene {
    
    private let manager = GameManager.shared
    
    var world: World { manager.world }
    
    // Timers
    private var timer: Timer?
    private var lastUpdate: TimeInterval
    
    init() {
        lastUpdate = Date().timeIntervalSince1970
        setup()
        onStart()
    }
    
    // Life Cicle
    func systemsToRegister() -> [System] { [] }
    func onStart() { print(#function) }
}

// MARK: - Private methods

private extension GameScene {
    private func setup() {
        let systems = systemsToRegister()
        manager.systems.register(systems)
        setupMainLoop()
    }
    
    func setupMainLoop() {
        let frameRate = manager.settings.desiredFrameRate
        
        timer = Timer.scheduledTimer(withTimeInterval: 1/frameRate, repeats: true) { [weak self] timer in
            self?.update()
        }
    }
    
    func update() {
        guard !manager.settings.isPaused else { return }
        
        // Update deltaTime
        let now = Date().timeIntervalSince1970
        let deltaTime = now - lastUpdate
        lastUpdate = now
        
        manager.systems.runSystems(deltaTime: deltaTime)
    }
}
