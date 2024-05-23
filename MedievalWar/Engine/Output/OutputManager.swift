import Foundation

class OutputManager {
    
    private(set) var render: OutputRender?
    
    static let shared = OutputManager()
    private init() {}
}

// MARK: - API
extension OutputManager {
    func setup(render: OutputRender) {
        self.render = render
    }
}
