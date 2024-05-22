import MetalKit

class VertexShaderLibrary: FlyweightFactory<MTLFunction, VertexShader> {
    
    private let library: MTLLibrary
    
    init(library: MTLLibrary) {
        self.library = library
    }
    
    override func makeObject(ofType objectType: VertexShader) throws -> MTLFunction {
        let shaderName = objectType.rawValue + "VertexShader"
        guard let function = library.makeFunction(name: shaderName) else { throw MetalLibraryError.vertexShaderNotFound }
        return function
    }
}
