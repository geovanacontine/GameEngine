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
        setupInput(device: .appleKeyboard)
        
        setupSystems(
            InputSystem(),
            PhysicsSystem(),
            MovementSystem()
        )
    }
    
    override func onBegin() {
        
        let warrior1 = Prefab(
            position: .init(x: 500, y: 500),
            body: .init(width: 60, height: 60),
            velocity: .init(maxSpeed: 200, x: 0, y: 0)
        )
        
        let warrior2 = Prefab(
            position: .init(x: 100, y: 500),
            body: .init(width: 25, height: 25),
            velocity: .init(maxSpeed: 300, x: 0, y: 0)
        )
        
        spawn(prefab: warrior1)
        spawn(prefab: warrior2)
    }
}
