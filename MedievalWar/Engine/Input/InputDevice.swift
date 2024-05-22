import Foundation

enum InputDevice {
    case appleKeyboard
    case other(GameInput)
}

extension InputDevice {
    var gameInput: GameInput {
        switch self {
        case .appleKeyboard: AppleKeyboard()
        case .other(let input): input
        }
    }
}
