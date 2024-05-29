import Foundation

class OutputManager {
    
    private(set) var render: OutputRender?
    
    func setup(render: OutputRender) {
        self.render = render
    }
}
