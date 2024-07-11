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
            Position(x: 0, y: 0, z: -1)
        )
        
        world.entityManager.spawn(
            Sprite(name: "zombie"),
            Outline(color: .init(r: 1, g: 1, b: 1, a: 1), width: 0.01),
            Mesh(type: .square),
            Scale(),
            Rotation(),
            Position(x: 0, y: 0),
            Velocity(maxSpeed: 2)
        )
        
        world.entityManager.spawn(
            Color(value: .init(r: 1, g: 0, b: 0, a: 0.5)),
            Mesh(type: .square),
            Scale(),
            Rotation(),
            Position(x: 2, y: 0),
            Velocity(maxSpeed: 5)
        )
        
        world.entityManager.spawn(
            Color(value: .init(r: 0, g: 0, b: 1, a: 1)),
            Mesh(type: .square),
            Scale(),
            Rotation(),
            Position(x: -2, y: 0),
            Velocity(maxSpeed: 5)
        )
    }
}
