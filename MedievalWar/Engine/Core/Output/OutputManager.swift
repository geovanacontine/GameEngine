import Foundation

class OutputManager {
    
    private(set) var render: OutputRender?
    private(set) var analytics: OutputAnalytics?
    
    func setup(render: OutputRender) {
        self.render = render
    }
    
    func setup(analytics: OutputAnalytics) {
        self.analytics = analytics
    }
}
