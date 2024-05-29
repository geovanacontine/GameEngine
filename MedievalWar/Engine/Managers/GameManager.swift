import Foundation

class GameManager {
    
    let input: InputManager
    let output: OutputManager
    let components: ComponentManager
    let entities: EntityManager
    let systems: SystemManager
    let settings: GameSettings
    
    static let shared = GameManager()
    
    private init() {
        input = InputManager()
        output = OutputManager()
        components = ComponentManager()
        entities = EntityManager(componentManager: components)
        systems = SystemManager()
        settings = GameSettings()
    }
}
