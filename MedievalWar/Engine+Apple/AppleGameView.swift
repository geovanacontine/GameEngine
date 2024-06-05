import SwiftUI

struct AppleGameView: View {
    
    let engine = GameEngine.shared
    let inputDevice = AppleKeyboard()
    let render = AppleRender()
    
    init() {
        engine.input.connect(device: inputDevice)
        engine.output.setup(render: render)
    }
    
    var body: some View {
        MetalView(render: render)
    }
}
