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
        
        world.entityManager.spawn(
            Camera(isActive: true, projectionType: .perspective),
            Rotation(x: 0, y: 0, z: 0),
            Position(x: 0, y: 0, z: -10)
        )
        
        for y in -20..<20 {
            for i in -20..<20 {
                world.entityManager.spawn(
                    Mesh(type: .cube),
                    Scale(x: 0.1, y: 0.1, z: 0.1),
                    Rotation(x: 0, y: 0, z: 0),
                    Position(x: Double(y)/3, y: Double(i) * 0.3, z: 0),
                    Velocity(maxSpeed: Double(i) * 0.2, x: 0, y: 0)
                )
            }
        }
    }
}
