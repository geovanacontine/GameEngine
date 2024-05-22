//
//  GameView.swift
//  MedievalWar
//
//  Created by Geovana Contine on 01/04/24.
//

import SwiftUI

struct GameView: View {
    
    private var scene = MedievalWarGame()
    
    var body: some View {
        MetalGameView(gameScene: scene)
    }
}
