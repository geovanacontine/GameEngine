import SwiftUI

struct MetalGameView: View, GameOutput {
    
    let gameScene: GameScene
    private let render = MetalRenderSystem()
    
    var body: some View {
        MetalView(renderSystem: render)
            .task { gameScene.output = self }
    }
    
    func draw(world: World) {
        render.object = .init(pipelineState: .basic, mesh: .triangle)
        
        for index in 0..<world.positionList.count {
            
            guard let position = world.positionList[index] else { continue }
//            print(position)
        }
    }
}
