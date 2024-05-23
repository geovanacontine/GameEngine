import SwiftUI

struct AppleGameView: View {
    
    let inputDevice = AppleKeyboard()
    let render = AppleRender()
    
    init() {
        InputManager.shared.connect(device: inputDevice)
        OutputManager.shared.setup(render: render)
    }
    
    var body: some View {
        MetalView(render: render)
    }
}
