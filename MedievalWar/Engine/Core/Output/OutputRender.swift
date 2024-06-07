import Foundation

protocol OutputRender {
    func draw(nodes: [RenderNode])
    func setup(camera: CameraNode)
}
