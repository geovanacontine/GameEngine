//
//  MedievalWarGame.swift
//  MedievalWar
//
//  Created by Geovana Contine on 02/04/24.
//

import Foundation

class MedievalWarGame {
    
    let world = World()
    
    init() {
        world.registerSystems(
            AnalyticsSystem(),
            InputSystem(),
            MovementSystem(),
            RotationSystem(),
            CameraSystem(),
            RenderSystem()
        )
        
        for y in -10..<10 {
            for i in -15..<15 {
                world.entityManager.spawn(
                    Mesh(pipelineState: .basic, meshType: .quad),
                    Scale(x: 0.1, y: 0.1, z: 0.1),
                    Rotation(x: 0, y: 0, z: 0),
                    Position(x: Double(i) * 0.1, y: Double(i) * 0.05, z: 0),
                    Velocity(maxSpeed: Double(y) * 0.3, x: 0, y: 0)
                )
            }
        }
        
        world.entityManager.spawn(
            Camera(isActive: true),
            Rotation(x: 0, y: 0, z: 0),
            Position(x: 0, y: 0, z: 0)
        )
        
//        world.entityManager.spawn(
//            Mesh(pipelineState: .basic, meshType: .quad),
//            Scale(x: 0.2, y: 0.2, z: 0),
//            Rotation(x: 0, y: 0, z: 0),
//            Position(x: 0, y: 0, z: 0),
//            Velocity(maxSpeed: 0.5, x: 0, y: 0)
//        )
    }
}
