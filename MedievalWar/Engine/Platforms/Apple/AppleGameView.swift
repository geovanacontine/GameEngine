import SwiftUI

struct AppleGameView: View, OutputAnalytics {
    
    let engine = GameEngine.shared
    let inputDevice = AppleKeyboard()
    let render = AppleRender()
    
    @State var analyticsData = AppleAnalyticsData()
    
    init() {
        engine.input.connect(device: inputDevice)
        engine.output.setup(render: render)
        engine.output.setup(analytics: self)
    }
    
    var body: some View {
        MetalView(render: render)
            .overlay(alignment: .topTrailing) {
                AppleAnalyticsView(data: analyticsData)
            }
    }
    
    func draw(data: AnalyticsData) {
        analyticsData.elapsedTime = data.elapsedTime
        analyticsData.aliveEntities = data.aliveEntities
        analyticsData.deadEntities = data.deadEntities
        analyticsData.archetypes = data.archetypes
        analyticsData.systems = data.systems
    }
}
