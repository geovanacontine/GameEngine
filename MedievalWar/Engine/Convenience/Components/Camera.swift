import Foundation

struct Camera: Component {
    var isActive: Bool
    var projectionType: CameraProjectionType
}

enum CameraProjectionType {
    case perspective
    case orthographic
}
