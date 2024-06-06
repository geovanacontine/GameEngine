//
//  MedievalWarGame.swift
//  MedievalWar
//
//  Created by Geovana Contine on 02/04/24.
//

import Foundation

class MedievalWarGame {
    
    let entityManager = GameEngine.shared.entityManager
    let world = World()
    
    init() {
        world.registerSystems(
            InputSystem(),
            MovementSystem(),
            RotationSystem(),
            RenderSystem()
        )
        
        for y in -10..<10 {
            for i in -10..<10 {
                entityManager.spawn(
                    Mesh(pipelineState: .basic, meshType: .quad),
                    Scale(x: 0.1, y: 0.1, z: 0.1),
                    Rotation(x: 0, y: 0, z: 0),
                    Position(x: Double(i) * 0.1, y: Double(i) * 0.05, z: 0),
                    Velocity(maxSpeed: Double(y) * 0.3, x: 0, y: 0)
                )
            }
        }
    }
}
