import SwiftUI

struct AppleGameView: View {
    
    let manager = GameManager.shared
    let inputDevice = AppleKeyboard()
    let render = AppleRender()
    
    init() {
        manager.input.connect(device: inputDevice)
        manager.output.setup(render: render)
    }
    
    var body: some View {
        MetalView(render: render)
    }
}
