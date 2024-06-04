//
//  MedievalWarGame.swift
//  MedievalWar
//
//  Created by Geovana Contine on 02/04/24.
//

import Foundation

class MedievalWarGame: GameScene {
    
    override func systemsToRegister() -> [System] {
        [
            InputSystem(),
            MovementSystem(),
            RenderSystem()
        ]
    }
    
    override func onStart() {
        
        let moveArchetype = Archetype(componentTypes: [Velocity.self, Mesh.self, Position.self, Rotation.self, Scale.self])
        world.register(archetype: moveArchetype, withId: "Move")
        
        
        for i in 0..<1000 {
            world.spawn(archetype: "Move", components: [
                Velocity(maxSpeed: 1.01 * Double(i), x: 0, y: 0),
                Mesh(pipelineState: .basic, meshType: .triangle),
                Position(x: 0, y: 0, z: 0),
                Rotation(x: 0, y: 0, z: 0),
                Scale(x: 1, y: 1, z: 1)
            ])
        }
        
//        for _ in 0..<9000 {
//            world.spawn(
//                archetype: BackgroundArchetype(
//                    mesh: .init(pipelineState: .basic, meshType: .triangle),
//                    position: .init(x: 0, y: 0, z: 0),
//                    rotation: .init(x: 0, y: 0, z: 0),
//                    scale: .init(x: 1, y: 1, z: 1)
//                )
//            )
//        }
    }
}
