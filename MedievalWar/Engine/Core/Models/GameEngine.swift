import Foundation

class GameEngine {
    
    let input: InputManager
    let output: OutputManager
    let settings: GameSettings
    let analytics: GameAnalytics
    
    static let shared = GameEngine()
    
    private init() {
        input = InputManager()
        output = OutputManager()
        settings = GameSettings()
        analytics = GameAnalytics()
    }
}
