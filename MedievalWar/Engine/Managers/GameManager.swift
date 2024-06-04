import Foundation

class GameManager {
    
    let input: InputManager
    let output: OutputManager
    let world: World
    let systems: SystemManager
    let settings: GameSettings
    
    static let shared = GameManager()
    
    private init() {
        input = InputManager()
        output = OutputManager()
        world = World()
        systems = SystemManager()
        settings = GameSettings()
    }
}
