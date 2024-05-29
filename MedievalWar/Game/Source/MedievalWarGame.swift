//
//  MedievalWarGame.swift
//  MedievalWar
//
//  Created by Geovana Contine on 02/04/24.
//

import Foundation

class MedievalWarGame: GameScene {
    
    let manager = GameManager.shared
    
    override func componentsToRegister() -> [Component.Type] {
        [
            Velocity.self,
            Mesh.self,
            Position.self,
            Rotation.self,
            Scale.self
        ]
    }
    
    override func systemsToRegister() -> [System] {
        [
            InputSystem(),
            MovementSystem(),
            RenderSystem()
        ]
    }
    
    override func onStart() {
        let velocity = Velocity(maxSpeed: 1, x: 0, y: 0)
        let mesh = Mesh(pipelineState: .basic, meshType: .quad)
        let position = Position(x: 0, y: 0, z: 0)
        
        _ = manager.entities.spawn(withComponents: [velocity, mesh, position])
        
        _ = manager.entities.spawn(withComponents: [velocity, Mesh(pipelineState: .basic, meshType: .triangle), position])
    }
}
