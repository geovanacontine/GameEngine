import Foundation

enum FragmentShader: String {
    case fill
    case outline
}

extension FragmentShader {
    var functionName: String { rawValue + "FragmentShader" }
}
