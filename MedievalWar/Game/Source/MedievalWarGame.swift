//
//  MedievalWarGame.swift
//  MedievalWar
//
//  Created by Geovana Contine on 02/04/24.
//

import Foundation

class MedievalWarGame: GameScene {
    
    override func onSetup() {
        setupFramesPerSecond(60)
        setupMap(width: 1000, height: 1000)
        
        setupSystems(
            InputSystem(),
            MovementSystem(),
            RenderSystem()
        )
    }
    
    override func onBegin() {
        
        let warrior = Prefab(
            transform: .init(
                position: .init(x: 0, y: 0, z: 0),
                rotation: .init(x: 0, y: 0, z: 0),
                scale: .init(x: 1, y: 1, z: 1)
            ), 
            mesh: .init(pipelineState: .basic, meshType: .quad),
            body: .init(width: 60, height: 60),
            velocity: .init(maxSpeed: 1, x: 0, y: 0)
        )
        
        spawn(prefab: warrior)
    }
}
