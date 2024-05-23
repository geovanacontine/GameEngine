import Foundation

enum MetalLibraryError: Error {
    case deviceNotFound
    case defaultLibraryNotFound
    case defaultCommandQueueNotFound
    case vertexShaderNotFound
    case fragmentShaderNotFound
    case deviceMakeBufferFailed
}
