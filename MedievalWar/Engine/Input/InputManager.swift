import Foundation

class InputManager {
    
    private(set) var device: InputDevice?
    
    func connect(device: InputDevice) {
        self.device = device
    }
    
    func disconnectDevice() {
        device = nil
    }
}
