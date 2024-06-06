import AppKit

class AppleKeyboard: InputDevice {
    
    var xAxis: Double = 0
    var yAxis: Double = 0
    
    init() {
        setupListeners()
    }
    
    private func setupListeners() {
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { [weak self] event in
            self?.handleKeyboardInput(keyCode: event.keyCode, isPressed: true)
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .keyUp) { [weak self] event in
            self?.handleKeyboardInput(keyCode: event.keyCode, isPressed: false)
            return event
        }
    }
    
    private func handleKeyboardInput(keyCode: UInt16, isPressed: Bool) {
        guard let key = Key(rawValue: keyCode) else { return }
        
        switch key {
        case .a, .arrowLeft: xAxis = isPressed ? -1 : 0
        case .d, .arrowRight: xAxis = isPressed ? 1 : 0
        case .s, .arrowDown: yAxis = isPressed ? 1 : 0
        case .w, .arrowUp: yAxis = isPressed ? -1 : 0
        }
    }
}

extension AppleKeyboard {
    enum Key: UInt16 {
        case a = 0
        case s = 1
        case d = 2
        case w = 13
        case arrowRight = 124
        case arrowLeft = 123
        case arrowUp = 126
        case arrowDown = 125
    }
}
