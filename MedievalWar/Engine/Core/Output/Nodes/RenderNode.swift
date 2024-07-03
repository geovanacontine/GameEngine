import Foundation

class RenderNode: Node {
    
    let sprite: Sprite
    
    init(
        sprite: Sprite,
        position: Position,
        rotation: Rotation,
        scale: Scale
    ) {
        self.sprite = sprite
        super.init(position: position, rotation: rotation, scale: scale)
    }
}
