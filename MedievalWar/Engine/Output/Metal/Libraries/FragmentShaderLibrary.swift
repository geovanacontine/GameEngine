import MetalKit

class FragmentShaderLibrary: FlyweightFactory<MTLFunction, FragmentShader> {
    
    private let library: MTLLibrary
    
    init(library: MTLLibrary) {
        self.library = library
    }
    
    override func makeObject(ofType objectType: FragmentShader) throws -> MTLFunction {
        let shaderName = objectType.rawValue + "FragmentShader"
        guard let function = library.makeFunction(name: shaderName) else { throw MetalLibraryError.fragmentShaderNotFound }
        return function
    }
}
