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
            RenderSystem()
        )
        
        for _ in 0..<500 {
            entityManager.spawn(
                Mesh(pipelineState: .basic, meshType: .triangle),
                Position(x: 0, y: 0, z: 0)
            )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            for i in 0..<500 {
                let velocity = Velocity(maxSpeed: 1.01 * Double(i), x: 0, y: 0)
                self.entityManager.add(component: velocity, to: i)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            for i in 0..<500 {
                self.entityManager.remove(component: Mesh.self, from: i)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            for i in 0..<500 {
                let mesh = Mesh(pipelineState: .basic, meshType: .quad)
                self.entityManager.add(component: mesh, to: i)
            }
        }
    }
}
