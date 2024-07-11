import simd

class RenderNode: Node {
    
    let mesh: Mesh
    let sprite: Sprite?
    let fragmentShader: FragmentShader
    
    // Calculated
    var hasTexture: Bool
    var material: simd_float4
    var outlineWidth: simd_float1 = 0
    
    init(
        sprite: Sprite,
        mesh: Mesh,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.sprite = sprite
        self.mesh = mesh
        
        hasTexture = true
        material = .init(x: 0, y: 0, z: 0, w: 0)
        fragmentShader = .fill
        
        super.init(position: position, rotation: rotation, scale: scale)
    }
    
    init(
        color: Color,
        mesh: Mesh,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.sprite = nil
        self.mesh = mesh
        
        hasTexture = false
        material = .init(x: color.value.r, y: color.value.g, z: color.value.b, w: color.value.a)
        fragmentShader = .fill
        
        super.init(position: position, rotation: rotation, scale: scale)
    }
    
    init(
        outline: Outline,
        mesh: Mesh,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.sprite = nil
        self.mesh = mesh
        
        hasTexture = false
        material = .init(x: outline.color.r, y: outline.color.g, z: outline.color.b, w: outline.color.a)
        fragmentShader = .outline
        outlineWidth = outline.width
        
        super.init(position: position, rotation: rotation, scale: scale)
    }
}
