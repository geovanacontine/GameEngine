import SwiftUI
import MetalKit

struct MetalView: NSViewRepresentable {
    
    let render: AppleRender
    
    func makeNSView(context: Context) -> MTKView {
        let view = MTKView()
        
        view.delegate = render
        view.device = render.manager.device
        view.drawableSize = view.frame.size
        view.isPaused = false
        view.colorPixelFormat = render.manager.pixelFormat
        view.depthStencilPixelFormat = render.manager.depthStencilPixelFormat
        
        return view
    }
    
    func updateNSView(_ nsView: MTKView, context: Context) {}
}
