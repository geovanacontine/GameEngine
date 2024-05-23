import Foundation

class InputManager {
    
    private(set) var device: InputDevice?
    
    static let shared = InputManager()
    private init() {}
}

// MARK: - API
extension InputManager {
    func connect(device: InputDevice) {
        self.device = device
    }
    
    func disconnectDevice() {
        device = nil
    }
}
