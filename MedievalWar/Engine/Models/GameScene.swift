import Foundation

class GameScene {
    
    // Protocols
    var output: GameOutput?
    private var input: GameInput?
    
    // Settings
    private var frameRate: Double
    
    // Timers
    private var timer: Timer?
    private var startTime: TimeInterval
    private var lastUpdate: TimeInterval
    
    // Private variables
    private var world: World
    private var systems: [System]
    
    // State
    private(set) var isRunning = false
    
    init() {
        frameRate = 60
        startTime = Date().timeIntervalSince1970
        lastUpdate = Date().timeIntervalSince1970
        world = World(mapWidth: 640, mapHeight: 480)
        systems = []
        
        onSetup()
        onBegin()
        resume()
    }
    
    // Overrides
    func onSetup() { print(#function) }
    func onBegin() { print(#function) }
}

// MARK: - Setup Methods

extension GameScene {
    func setupInput(device: InputDevice) {
        input = device.gameInput
    }
    
    func setupFramesPerSecond(_ frameRate: Int) {
        self.frameRate = Double(frameRate)
    }
    
    func setupSystems(_ systems: System...) {
        self.systems = systems
    }
    
    func setupMap(width: Double, height: Double) {
        world.mapWidth = height
        world.mapHeight = height
    }
}

// MARK: - Actions

extension GameScene {
    func spawn(prefab: Prefab) {
        world.spawn(prefab)
    }
    
    func destroy(id: Int) {
        world.destroy(id: id)
    }
    
    func resume() {
        isRunning = true
        setupMainLoop()
    }
    
    func pause() {
        isRunning = false
        timer?.invalidate()
    }
}

// MARK: - Main Loop

private extension GameScene {
    func setupMainLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 1/frameRate, repeats: true) { [weak self] timer in
            self?.update()
        }
    }
    
    func update() {
        
        // Update deltaTime
        let now = Date().timeIntervalSince1970
        let deltaTime = now - lastUpdate
        lastUpdate = now
        
        // Update Systems
        for system in systems {
            system.update(world: &world, input: &input, deltaTime: deltaTime)
        }
        
        // Render
        output?.draw(world: world)
    }
}
