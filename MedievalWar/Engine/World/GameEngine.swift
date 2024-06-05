import Foundation

class GameEngine {
    
    let input: InputManager
    let output: OutputManager
    let settings: GameSettings
    let entityManager: EntityManager
    
    static let shared = GameEngine()
    
    private init() {
        input = InputManager()
        output = OutputManager()
        settings = GameSettings()
        entityManager = EntityManager()
    }
}
