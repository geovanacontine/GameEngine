import SwiftUI
import MetalKit

struct MetalView: NSViewRepresentable {
    
    let renderSystem: MetalRenderSystem
    
    func makeNSView(context: Context) -> MTKView {
        let view = MTKView()
        
        view.delegate = renderSystem
        view.device = renderSystem.manager.device
        view.drawableSize = view.frame.size
        view.isPaused = false
        view.colorPixelFormat = renderSystem.manager.pixelFormat
        
        return view
    }
    
    func updateNSView(_ nsView: MTKView, context: Context) {}
}
