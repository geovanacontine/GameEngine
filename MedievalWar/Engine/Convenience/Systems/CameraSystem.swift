import Foundation

struct CameraSystem: System {
    func update(entityManager: EntityManager, deltaTime: TimeInterval) {
        
        var cameras: [CameraNode] = []
        
        entityManager.forEach(Camera.self, Position.self, Rotation.self) { camera, position, rotation in
            guard camera.isActive else { return }
            
            cameras.append(
                CameraNode(
                    projectionType: camera.projectionType, 
                    position: position,
                    rotation: rotation,
                    scale: .init(x: 1, y: 1, z: 1)
                )
            )
        }
        
        if let activeCamera = cameras.first {
            engine.output.render?.setup(camera: activeCamera)
        }
    }
}
