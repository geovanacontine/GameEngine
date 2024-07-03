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
            Movement2DSystem(),
            RotationSystem(),
            CameraSystem(),
            Render2DSystem()
        )
        
        world.entityManager.spawn(
            Camera(isActive: true, projectionType: .orthographic),
            Rotation(x: 0, y: 0, z: 0),
            Position(x: 0, y: 0, z: 0)
        )
        
        for i in -3...3 {
            world.entityManager.spawn(
                Sprite(named: "zombie"),
                Scale(),
                Rotation(),
                Position(x: Double(i) * 2, y: 0),
                Velocity(maxSpeed: Double(i) * 2)
            )
        }
    }
}
